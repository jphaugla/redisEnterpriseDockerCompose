sudo docker exec -it n1 bash -c "/opt/redislabs/bin/rladmin cluster create persistent_path \
 /var/opt/redislabs/persist  ephemeral_path /var/opt/redislabs/tmp  addr  172.18.0.21  \
name north.redislabs-training.org username admin@redislabs-training.org  password admin";
sudo docker exec n2 bash -c "/opt/redislabs/bin/rladmin cluster join persistent_path \
/var/opt/redislabs/persist  ephemeral_path /var/opt/redislabs/tmp  addr 172.18.0.22   \
username admin@redislabs-training.org  password admin nodes 172.18.0.21"
sudo docker exec n3 bash -c "/opt/redislabs/bin/rladmin cluster join persistent_path \
/var/opt/redislabs/persist  ephemeral_path /var/opt/redislabs/tmp  addr  172.18.0.23  \
username admin@redislabs-training.org  password admin nodes 172.18.0.21"
