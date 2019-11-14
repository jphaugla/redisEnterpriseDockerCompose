#!/bin/bash
# Create a demo database
echo "Creating demo-db database..."
rm create_demodb.sh
tee -a create_demodb.sh <<EOF
curl -v -k -u REDemo@redislabs.com:redis123 -X POST https://localhost:9443/v1/bdbs -H Content-type:application/json -d '{ "name": "demo-db", "port": 12000, "memory_size": 100000000, "type" : "redis", "replication": false}'
EOF
sudo docker cp create_demodb.sh re-node1:/opt/create_demodb.sh
sudo docker exec --user root -it re-node1 bash -c "chmod 777 /opt/create_demodb.sh"
sudo docker exec --user root -it re-node1 bash -c "/opt/create_demodb.sh"
sudo docker exec -it re-node1 bash -c "redis-cli -h redis-12000.cluster1.local -p 12000 PING"
sudo docker exec -it re-node1 bash -c "rladmin status databases"       
sudo docker port re-node1 | grep 12000

echo "Now open the browser and access Redis Enterprise Admin UI at https://127.0.0.1:18443 with username=REDemo@redislabs.com and password=redis123."
