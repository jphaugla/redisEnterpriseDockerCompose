#!/usr/local/bin/python3

import redis
import pprint
import time

try:
  r = redis.StrictRedis(
    decode_responses=True,
    host='redis-12000.north.redislabs-training.org',
    port=12000
    )
  for x in range(1000):
    key="key" + str(x) 
    r.set(key,x)
    print("last print " + key)
    time.sleep(.5)

except Exception as err:
  print("Error connecting to Redis: {}".format(err))
