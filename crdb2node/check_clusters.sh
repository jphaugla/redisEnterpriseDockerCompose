# Test the cluster 1
sudo docker exec -it re-node1 bash -c "/opt/redislabs/bin/rladmin status"
# Test the cluster 2
sudo docker exec -it re-node2 bash -c "/opt/redislabs/bin/rladmin status"
