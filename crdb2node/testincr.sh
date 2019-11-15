#!/bin/bash
# kick off increment script
echo "run increment"
sudo docker cp increment.sh re-node1:/opt/increment.sh
sudo docker exec --user root -it re-node1 bash -c "chmod 777 /opt/increment.sh"
sudo docker exec --user root -it re-node1 bash -c "/opt/increment.sh"
