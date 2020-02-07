#!/usr/local/bin/python3

import redis
import pprint

try:
  r = redis.StrictRedis(
    host='re-node1',
    port=12000,
    password='secretdb01',
    decode_responses=True,
    ssl=True,
    ssl_keyfile='./certificates/client_key_app_001.pem',
    ssl_certfile='./certificates/client_cert_app_001.pem',
    ssl_cert_reqs='required',
    ssl_ca_certs='./certificates/proxy_cert1.pem'
    )

  info = r.info()
  pprint.pprint(info)
  r.set('pythonREnode1','setfrom1')
  r.set('pythonREnode1again1','setfrom1')

except Exception as err:
  print("Error connecting to Redis: {}".format(err))
