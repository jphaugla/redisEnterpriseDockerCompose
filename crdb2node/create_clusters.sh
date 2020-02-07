#!/bin/bash

docker-compose down

echo "removing docker volumes"
docker volume rm crdb2node_redispers1
docker volume rm crdb2node_redispers2
docker volume rm crdb2node_redispers3

docker-compose up -d

echo "starting to sleep"
sleep 60

echo "Creating Redis Enterprise clusters..."
sudo docker exec -it --privileged re-node1 "/opt/redislabs/bin/rladmin" cluster create name cluster1.local username REDemo@redislabs.com password redis123

sudo docker exec -it --privileged re-node2 "/opt/redislabs/bin/rladmin" cluster create name cluster2.local username REDemo@redislabs.com password redis123

sudo docker exec -it --privileged re-node3 "/opt/redislabs/bin/rladmin" cluster create name cluster3.local username REDemo@redislabs.com password redis123

# Test the cluster 1
docker exec -it re-node1 bash -c "/opt/redislabs/bin/rladmin status"
# Test the cluster 2
docker exec -it re-node2 bash -c "/opt/redislabs/bin/rladmin status"
# Test the cluster 3
docker exec -it re-node3 bash -c "/opt/redislabs/bin/rladmin status"
