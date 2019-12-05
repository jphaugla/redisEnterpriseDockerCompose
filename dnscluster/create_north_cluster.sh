sudo docker kill n1;sudo docker rm n1;
sudo docker kill n2;sudo docker rm n2;
sudo docker kill n3;sudo docker rm n3;
sudo docker run -d  --cap-add=ALL --name n1  -v /opt/redislabs/resolv.conf:/etc/resolv.conf -v /opt/redislabs/log/n1/:/var/opt/redislabs
/log -p 21443:8443 -p 41443:9443 --restart=always  --hostname  n1.north.redislabs-training.org --net redislabs --ip 172.18.0.21  redisla
bs/redis
sudo docker run -d  --cap-add=ALL --name n2  -v /opt/redislabs/resolv.conf:/etc/resolv.conf -v /opt/redislabs/log/n2/:/var/opt/redislabs
/log -p 22443:8443 -p 42443:9443 --restart=always  --hostname  n2.north.redislabs-training.org  --net redislabs --ip 172.18.0.22   redis
labs/redis
sudo docker run -d  --cap-add=ALL --name n3  -v /opt/redislabs/resolv.conf:/etc/resolv.conf -v /opt/redislabs/log/n3/:/var/opt/redislabs
/log -p 23443:8443 -p 43443:9443 --restart=always  --hostname  n3.north.redislabs-training.org  --net redislabs --ip 172.18.0.23    redi
slabs/redis
sudo docker exec --user root n1 bash -c "iptables -t nat -I PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 5300"
sudo docker exec --user root n2 bash -c "iptables -t nat -I PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 5300"
sudo docker exec --user root n3 bash -c "iptables -t nat -I PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 5300"
sleep 60
