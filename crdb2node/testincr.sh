#!/bin/bash
# kick off increment script
echo "run increment"
docker cp increment.sh re-node1:/opt/increment.sh
docker exec -it re-node1 bash -c "/opt/increment.sh"
