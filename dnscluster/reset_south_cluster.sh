sudo docker kill s1;sudo docker rm s1;
sudo docker kill s2;sudo docker rm s2;
sudo docker kill s3;sudo docker rm s3;
sudo docker run -d  --cap-add=ALL  -v /opt/redislabs/resolv.conf:/etc/resolv.conf -v /opt/redislabs/log/s1/:/var/opt/redislabs/log --nam
e s1 -p 31443:8443 -p 51443:9443 --restart=always --hostname  s1.south.redislabs-training.org   --net redislabs --ip 172.18.0.31  redisl
abs/redis
sudo docker run -d  --cap-add=ALL  -v /opt/redislabs/resolv.conf:/etc/resolv.conf -v /opt/redislabs/log/s2/:/var/opt/redislabs/log --nam
e s2 -p 32443:8443 -p 52443:9443 --restart=always --hostname s2.south.redislabs-training.org   --net redislabs --ip 172.18.0.32  redisla
bs/redis
sudo docker run -d  --cap-add=ALL  -v /opt/redislabs/resolv.conf:/etc/resolv.conf -v /opt/redislabs/log/s3/:/var/opt/redislabs/log --nam
e s3 -p 33443:8443 -p 53443:9443 --restart=always  --hostname s3.south.redislabs-training.org   --net redislabs --ip 172.18.0.33   redis
labs/redis
sudo docker exec --user root s1 bash -c "iptables -t nat -I PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 5300"
sudo docker exec --user root s2 bash -c "iptables -t nat -I PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 5300"
sudo docker exec --user root s3 bash -c "iptables -t nat -I PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 5300"
sleep 60
