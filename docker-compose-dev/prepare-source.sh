#!/bin/bash

echo "Generating an SSL certificate..."

openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -config ./openssl.cnf -outform PEM -out ./fullchain.pem -keyout ./privkey.pem

echo "Pulling sources..."

mkdir -p seatplus && cd seatplus
git clone https://github.com/seatplus/core
git clone https://github.com/seatplus/web
git clone https://github.com/seatplus/eveapi
git clone https://github.com/seatplus/auth

echo "Done! docker-compose up now!"