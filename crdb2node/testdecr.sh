#!/bin/bash
# test dercrement
echo "testing decrement"
docker cp decrement.sh re-node2:/opt/decrement.sh
docker exec  -it re-node2 bash -c "/opt/decrement.sh"
