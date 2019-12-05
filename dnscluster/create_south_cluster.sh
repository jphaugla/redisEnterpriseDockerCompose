sudo docker exec s1 bash -c "/opt/redislabs/bin/rladmin cluster create \
persistent_path /var/opt/redislabs/persist  ephemeral_path /var/opt/redislabs/tmp  \
addr  172.18.0.31  name south.redislabs-training.org username admin@redislabs-training.org  password admin"
sudo docker exec s2 bash -c "/opt/redislabs/bin/rladmin cluster join \
 persistent_path /var/opt/redislabs/persist  ephemeral_path /var/opt/redislabs/tmp  \
addr 172.18.0.32   username admin@redislabs-training.org  password admin nodes 172.18.0.31"
sudo docker exec s3 bash -c "/opt/redislabs/bin/rladmin cluster join \
 persistent_path /var/opt/redislabs/persist  ephemeral_path /var/opt/redislabs/tmp  \
addr 172.18.0.33   username admin@redislabs-training.org  password admin nodes 172.18.0.31"
