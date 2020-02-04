#!/bin/bash
# Create a demo database
echo "Creating demo-db database..."
rm create_crdbTLS.sh
tee -a create_crdbTLS.sh <<EOF
curl -v -k -u REDemo@redislabs.com:redis123  -H "Content-Type: application/json" -X POST -d '{"default_db_config": {"name": "crdb-encrypt", "bigstore": false, "authentication_redis_pass":"secretdb01", "data_persistence": "aof", "replication": false, "memory_size": 102400000, "aof_policy": "appendfsync-every-sec", "snapshot_policy": [], "shards_count": 1, "port": 12000}, "instances": [{"cluster": {"url": "http://cluster1.local:8080", "credentials": {"username": "REDemo@redislabs.com", "password": "redis123"}, "name": "cluster1.local"}, "compression": 6}, {"cluster": {"url": "http://cluster2.local:8080", "credentials": {"username": "REDemo@redislabs.com", "password": "redis123"}, "name": "cluster2.local"}, "compression": 6}], "encryption": true, "name": "crdb-encrypt"}' http://localhost:8080/v1/crdbs
EOF
chmod 755 create_crdbTLS.sh
docker cp create_crdbTLS.sh re-node1:/opt/create_crdbTLS.sh
docker exec -it re-node1 bash -c "/opt/create_crdbTLS.sh"
docker exec -it re-node1 bash -c "rladmin status databases"       

echo "Now open the browser and access Redis Enterprise Admin UI at https://127.0.0.1:18443 with username=REDemo@redislabs.com and password=redis123."
