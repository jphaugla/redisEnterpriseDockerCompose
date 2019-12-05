sudo docker run --name splunk -d -p 8000:8000 -v /opt/redislabs/resolv.conf:/etc/resolv.conf --net redislabs --ip 172.18.0.41  -e 'SPLUN
K_START_ARGS=--accept-license' -e 'SPLUNK_PASSWORD=P@ssword1' splunk/splunk:latest
