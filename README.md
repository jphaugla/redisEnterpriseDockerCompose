## A 3 node Redis Enterprise cluster setup in Docker containers (For Development purpose only)

This is heavily lifted from work by Virag Trapathi.  I just took his work and added docker-compose and volumes.  He did the hard parts!!
for more detail and additional content see:   https://github.com/viragtripathi/redis-enterprise-docker

### Prerequisites

Docker compatible OS and Docker installed.
  - (I have it setup on my MacBook Pro but you can run it on any OS with Docker as long as you tweak the script based on runtime requirements.)
Update Docker resources with 4 CPUs and 6-10GB RAM as shown here, <a href="https://github.com/viragtripathi/redis-enterprise-docker/blob/master/Screen%20Shot%202019-06-19%20at%2011.55.53%20AM.png">Docker Preferences...</a>

## Steps for 3 node cluster
1. Change directory to cluster3node

2. Execute create_redis_enterprise_3_node_cluster.sh to create a 3 node(server) Redis Enterprise cluster

3. execute createDB.sh to create a database

4. Execute cleanup.sh to kill and remove the 3 docker containers. [OPTIONAL]

5. Execute destroy.sh to remove the containers and also delete the <a href="https://hub.docker.com/r/redislabs/redis">redislabs/redis</a> images. [OPTIONAL]

6. Execute remove_volumes.sh to remove the redis volumes for the containers

## Steps for CRDB test

## Additional info

* <a href="https://hub.docker.com/r/redislabs/redis">Redis Labs Docker image</a>

* <a href="https://oss.redislabs.com/redisearch/index.html">RediSearch Documentation</a>

* <a href="https://oss.redislabs.com/redisjson/">ReJSON Documentation</a>

* <a href="https://oss.redislabs.com/redisbloom/">RedisBloom Documentation</a>

* <a href="https://oss.redislabs.com/redisgraph/">RedisGraph Documentation</a>

* <a href="https://oss.redislabs.com/redistimeseries/">RedisTimeSeries Documentation</a>
