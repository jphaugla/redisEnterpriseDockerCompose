guid=$1
docker exec -it re-node1 bash -c "/opt/redislabs/bin/crdb-cli crdb delete --crdb-guid $guid"
