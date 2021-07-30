#!/bin/bash

echo "removing all contains in local docker-compose file with docker-compose down"
docker-compose down

echo "removing docker volumes"
docker volume rm redis-enterprise-docker_redispers1
docker volume rm redis-enterprise-docker_redispers2
docker volume rm redis-enterprise-docker_redispers3

# Start 3 docker containers. Each container is a node in the same network
docker-compose up -d

echo "starting to sleep"
sleep 90

echo "Creating Redis Enterprise cluster and joining nodes..."
sudo docker exec -it --privileged re-node1 "/opt/redislabs/bin/rladmin" cluster create name cluster1.local username REDemo@redislabs.com password redis123
sudo docker exec -it --privileged re-node2 "/opt/redislabs/bin/rladmin" cluster join nodes $(sudo docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' re-node1) username REDemo@redislabs.com password redis123
sudo docker exec -it --privileged re-node3 "/opt/redislabs/bin/rladmin" cluster join nodes $(sudo docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' re-node1) username REDemo@redislabs.com password redis123

# Test the cluster 
sudo docker exec -it re-node1 bash -c "/opt/redislabs/bin/rladmin status"
