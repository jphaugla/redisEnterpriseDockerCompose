#!/bin/bash
# test dercrement
echo "testing decrement"
sudo docker cp decrement.sh re-node2:/opt/decrement.sh
sudo docker exec --user root -it re-node2 bash -c "chmod 777 /opt/decrement.sh"
sudo docker exec --user root -it re-node2 bash -c "/opt/decrement.sh"
