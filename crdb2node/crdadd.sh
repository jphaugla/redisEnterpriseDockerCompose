guid=$1
docker exec -it re-node1 bash -c "/opt/redislabs/bin/crdb-cli crdb add-instance --crdb-guid $guid --instance fqdn=cluster3.local,username=REDemo@redislabs.com,password=redis123"
