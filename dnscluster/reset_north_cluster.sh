echo "shutting down the containers"
docker-compose down
echo "removing the volumes"
./remove_north_volumes.sh
# docker volume rm dnscluster_binddata

echo "starting the containers"
docker-compose up -d
echo "running iptables on redis nodes"
./north_ip_tables.sh
echo "sleeping for 1 minute"
sleep 60
