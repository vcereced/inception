#!/bin/bash

openssl genpkey -algorithm RSA -out server.key -pkeyopt rsa_keygen_bits:2048
openssl req -new -key server.key -out server.csr -subj "/C=ES/ST=MALAGA/L=MALAGA/O=PERSONAL/OU=42/CN=NGINX/emailAddress=VICTOR@GMAIL.COM"
openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt

mv server.crt /etc/nginx/server.crt
mv server.key /etc/nginx/server.key

nginx -g "daemon off;"