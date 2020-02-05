#!/usr/local/bin/python3

import redis
import pprint

try:
  r = redis.StrictRedis(
    decode_responses=True,
    host='re-node2',
    port=12005
    )

  info = r.info()
  pprint.pprint(info)

except Exception as err:
  print("Error connecting to Redis: {}".format(err))
