echo "shutting down the containers"
docker-compose -f docker-compose-south.yml -f docker-compose.yml down
echo "removing the north volumes"
./remove_north_volumes.sh
echo "removing the south volumes"
./remove_south_volumes.sh
