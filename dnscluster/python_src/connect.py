#!/usr/local/bin/python3

import redis
import pprint

try:
  r = redis.StrictRedis(
    decode_responses=True,
    host='redis-12000.north.redislabs-training.org',
    port=12000
    )

  info = r.info()
  pprint.pprint(info)

except Exception as err:
  print("Error connecting to Redis: {}".format(err))
