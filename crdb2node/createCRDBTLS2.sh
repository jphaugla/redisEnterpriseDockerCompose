curl -v -k -u admin@redislabs.org:admin  -H "Content-Type: application/json" -X POST -d '{"default_db_config": {"na
me": "jph-encrypt", "bigstore": false, "authentication_redis_pass":"secretdb01", "authentication_ssl_client_certs":
[{"client_cert":"-----BEGIN CERTIFICATE-----\nMIIDXzCCAkegAwIBAgIJAOr2CODBka/tMA0GCSqGSIb3DQEBCwUAMEUxCzAJBgNV\nBAY
TAkFVMRMwEQYDVQQIDApTb21lLVN0YXRlMSEwHwYDVQQKDBhJbnRlcm5ldCBX\naWRnaXRzIFB0eSBMdGQwIBcNMjAwMjA1MDA1MTQ0WhgPMjEyMDAx
MTIwMDUxNDRa\nMEUxCzAJBgNVBAYTAkFVMRMwEQYDVQQIDApTb21lLVN0YXRlMSEwHwYDVQQKDBhJ\nbnRlcm5ldCBXaWRnaXRzIFB0eSBMdGQwggE
iMA0GCSqGSIb3DQEBAQUAA4IBDwAw\nggEKAoIBAQC0wNWJmqURMOx86i6F/BmjagZCfLjJZURX3Khj19+12xm9vzfUtdcF\nW7e3yR1CD1zlzAQRPx
bK3JzCOtnVIDFjVmZjRspzcoWEAoNLoe8UTrhmyitrwsgV\nzncbMfbsNDrVNKPIySNLCK5tsms1snhEg8GVxjp61k0hVFZ2XWx2DL9ybqF+q05F\nf
QOeqSgFwBYYL9U0S1oIk0fvgLdC/zb7Mzar0LIcxOLkffHAOXYwclsp1qFWZcef\nuNjR3EsapQBStwnLNQ4iyVGy3/P6REAl4fNk9KroZ4XLF2UWjn
s5zF9KnLGw+6X+\nduSyeJqaGdh5AsbVewkC+900JqmPK6rlAgMBAAGjUDBOMB0GA1UdDgQWBBQtjqZa\nXNanHl3bkv5csIf5cMQkfTAfBgNVHSMEG
DAWgBQtjqZaXNanHl3bkv5csIf5cMQk\nfTAMBgNVHRMEBTADAQH/MA0GCSqGSIb3DQEBCwUAA4IBAQBhIiwTBVjOIC83wMbO\nLk+IhoP0Gd7tcAI7
oO1E2XvB0dZ1AEI6Wb2Y233ZQsQ2LlHOXlW/2DYCM2ag395p\ngWV9aUYc2z1chhhF6zQRiy/XBZ8rWmHPJ5irstUz6BR2wE/EyzgjTAUMVGJTCd4K\
nad+uySe++zgTyfCGxQoQ8KXN17tIGNYkAdEA6rIUptBjdthU82tzhJVEKmtpIDYH\n8hjl4ew87oLHbRPFHaNt/007M+LHqCmv4W5fzX1YnTCojC+3
HtN6qT9oM6YlD280\n2qPmtIgScYSWsil5MR2bytiBObd5y7FlrdBj3Ld+y0duCfkV8tJ/zPn5zYdkIrp8\nRsWY\n-----END CERTIFICATE-----
"}], "replication": false, "memory_size": 10240000, "snapshot_policy": [], "shards_count": 1, "port": 12006}, "inst
ances": [{"cluster": {"url": "http://jph-vu-kc.demo.redislabs.com:8080", "credentials": {"username": "admin@redisla
bs.org", "password": "admin"}, "name": "jph-vu-kc.demo.redislabs.com"}, "compression": 6}, {"cluster": {"url": "htt
p://jph-vu-olathe.demo.redislabs.com:8080", "credentials": {"username": "admin@redislabs.org", "password": "admin"}
, "name": "jph-vu-olathe.demo.redislabs.com"}, "compression": 6} ], "encryption": true, "ssl":true, "tls_mode":"ena
bled", "name": "jph-encrypt"}' http://localhost:8080/v1/crdbs
