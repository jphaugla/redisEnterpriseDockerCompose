echo "shutting down the containers"
docker-compose down
echo "removing the volumes"
docker volume rm dnscluster_redispers1
docker volume rm dnscluster_redispers2
docker volume rm dnscluster_redispers3
docker volume rm dnscluster_redislogs1
docker volume rm dnscluster_redislogs2
docker volume rm dnscluster_redislogs3
# docker volume rm dnscluster_binddata

echo "starting the containers"
docker-compose up -d
echo "running iptables on redis nodes"
sudo docker exec --user root n1 bash -c "iptables -t nat -I PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 5300"
sudo docker exec --user root n2 bash -c "iptables -t nat -I PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 5300"
sudo docker exec --user root n3 bash -c "iptables -t nat -I PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 5300"
echo "sleeping for 1 minute"
sleep 60
