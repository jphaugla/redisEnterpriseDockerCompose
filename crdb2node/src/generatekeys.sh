openssl req \
  -nodes \
 -newkey rsa:2048 \
 -keyout certificates/client_key_app_001.pem \
 -x509 \
 -days 36500 \
 -out certificates/client_cert_app_001.pem
