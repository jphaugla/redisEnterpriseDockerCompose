#!/bin/bash

docker-compose down

echo "removing docker volumes"
docker volume rm crdb2node_redispers1
docker volume rm crdb2node_redispers2

docker-compose up -d

echo "starting to sleep"
sleep 60

echo "Creating Redis Enterprise cluster and joining nodes..."
sudo docker exec -it --privileged re-node1 "/opt/redislabs/bin/rladmin" cluster create name cluster1.local username REDemo@redislabs.com password redis123

sudo docker exec -it --privileged re-node2 "/opt/redislabs/bin/rladmin" cluster create name cluster2.local username REDemo@redislabs.com password redis123

# Test the cluster 1
sudo docker exec -it re-node1 bash -c "/opt/redislabs/bin/rladmin status"
# Test the cluster 2
sudo docker exec -it re-node2 bash -c "/opt/redislabs/bin/rladmin status"
