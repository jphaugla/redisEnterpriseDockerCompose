# sudo docker exec -it n1 bash -c "/opt/redislabs/bin/rladmin cluster create persistent_path \
#  /var/opt/redislabs/persist  ephemeral_path /var/opt/redislabs/tmp  addr  172.21.1.1  \
# name north.redislabs-training.org username admin@redislabs-training.org  password admin";
sudo docker exec n2 bash -c "/opt/redislabs/bin/rladmin cluster join persistent_path \
/var/opt/redislabs/persist  ephemeral_path /var/opt/redislabs/tmp  addr 172.21.1.2   \
username admin@redislabs-training.org  password admin nodes 172.21.1.1"
sudo docker exec n3 bash -c "/opt/redislabs/bin/rladmin cluster join persistent_path \
/var/opt/redislabs/persist  ephemeral_path /var/opt/redislabs/tmp  addr  172.21.1.3  \
username admin@redislabs-training.org  password admin nodes 172.21.1.1"
