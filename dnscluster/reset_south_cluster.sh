echo "shutting down the containers"
docker-compose -f docker-compose-south.yml  down
echo "removing the south volumes"
./remove_south_volumes.sh
echo "starting the south containers"
docker-compose -f docker-compose-south.yml up -d
echo "running iptables on redis nodes"
./south_ip_tables.sh
echo "sleeping for 1 minute"
sleep 60
