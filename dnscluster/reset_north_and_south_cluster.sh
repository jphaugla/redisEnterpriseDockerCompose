echo "shutting down the containers"
docker-compose -f docker-compose-south.yml -f docker-compose.yml down
echo "removing the north volumes"
./remove_north_volumes.sh
echo "removing the south volumes"
./remove_south_volumes.sh
echo "starting the north and south containers"
docker-compose -f docker-compose-south.yml -f docker-compose.yml up -d
echo "running iptables on redis nodes"
./south_ip_tables.sh
./north_ip_tables.sh
echo "sleeping for 1 minute"
sleep 60
