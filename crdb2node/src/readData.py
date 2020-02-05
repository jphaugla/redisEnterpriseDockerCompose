#!/usr/local/bin/python3

import redis
import pprint

try:
  r = redis.StrictRedis(
    host='re-node2',
    port=12000,
    password='secretdb01',
    decode_responses=True,
    ssl=True,
    ssl_keyfile='./certificates/client_key_app_001.pem',
    ssl_certfile='./certificates/client_cert_app_001.pem',
    ssl_cert_reqs='required',
    ssl_ca_certs='./certificates/proxy_cert2.pem'
    )

  info = r.get('pythonREnode1')
  info2 = r.get('pythonREnode1again1')
  pprint.pprint("value of pythonREnode1 from node2 " + info)
  pprint.pprint("value of pythonREnode1again1 from node2 " + info2)

except Exception as err:
  print("Error connecting to Redis: {}".format(err))
