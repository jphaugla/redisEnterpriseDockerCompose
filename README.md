## A 3 node Redis Enterprise cluster setup in Docker containers (For Development purpose only)

This is heavily lifted from work by Virag Trapathi.  I just took his work and added docker-compose and volumes.  He did the hard parts!!
for more detail and additional content see:   https://github.com/viragtripathi/redis-enterprise-docker

### Prerequisites

Docker compatible OS and Docker installed.
  - (I have it setup on my MacBook Pro but you can run it on any OS with Docker as long as you tweak the script based on runtime requirements.)
Update Docker resources with 4 CPUs and 6-10GB RAM as shown here, <a href="https://github.com/viragtripathi/redis-enterprise-docker/blob/master/Screen%20Shot%202019-06-19%20at%2011.55.53%20AM.png">Docker Preferences...</a>

## Steps for 3 node cluster
1. Change directory to cluster3node
```
cd cluster3node
```

2. Execute create_redis_enterprise_3_node_cluster.sh to create a 3 node(server) Redis Enterprise cluster
```
./create_redis_enterprise_3_node_cluster.sh
```
3. execute createDB.sh to create a database
```
./createDB.sh
```
4. Execute cleanup.sh to kill and remove the 3 docker containers. [OPTIONAL]

5. Execute destroy.sh to remove the containers and also delete the <a href="https://hub.docker.com/r/redislabs/redis">redislabs/redis</a> images. [OPTIONAL]

6. Execute remove_volumes.sh to remove the redis volumes for the containers

## Steps for CRDB test

1. Change directory to crdb2node

2. Execute create_redis_enterprise_2_node_cluster.sh to create 2 separate one node clusters

3. execute createCRDB.sh to create a CRDB clustered database on each cluster

4. test writing in each cluster and seeing result in other cluster
```
sudo docker exec -it re-node1 bash
redis-cli -p 12005
set hello1 on1
get hello2
```

```
sudo docker exec -it re-node2 bash
redis-cli -p 12005
set hello2 on2
get hello1
```
5. test simultaneous increment and decrement
start increment on cluster1
```
./testincr.sh
```
start decrement on cluster2
```
./testdecr.sh
```

6. take node 1 out of the network using 
```
docker network disconnect crdb2node_default re-node1
```

7. test writing and see that values don't update
```
sudo docker exec -it re-node1 bash
redis-cli -p 12005
set nogo1 on1
get nogo2
```

```
sudo docker exec -it re-node2 bash
redis-cli -p 12005
set nogo2 on2
get nogo1
```

8. restore the network and the entries will come back
```
docker network connect crdb2node_default re-node1
```
## Steps for dns redis cluster
1. Change directory to dnscluster
2. To bring up both north and south cluster
```bash 
./reset_north_and_south_cluster.sh
```
3. Instead, to bring up only north cluster
```bash
./reset_north_cluster.sh
```
4. To access dns server from browser
```bash
https://localhost:10000
```
5. DNS database is included.  This is setup if needed
* address records
![Address Records](images/DNS_address_records.png)
* namespace records
![Namesapce records](images/DNS_name_server_records.png)
6. Can shutdown all resources
```bash
./shutdown_all.sh
```

##  Additional Links
* <a href="https://hub.docker.com/r/redislabs/redis">Redis Labs Docker image</a>

* <a href="https://oss.redislabs.com/redisearch/index.html">RediSearch Documentation</a>

* <a href="https://oss.redislabs.com/redisjson/">ReJSON Documentation</a>

* <a href="https://oss.redislabs.com/redisbloom/">RedisBloom Documentation</a>

* <a href="https://oss.redislabs.com/redisgraph/">RedisGraph Documentation</a>

* <a href="https://oss.redislabs.com/redistimeseries/">RedisTimeSeries Documentation</a>
* <a href="https://dzone.com/articles/getting-started-with-active-active-geo-distributio/">Dzone CRDT with Redis Enterprise 
