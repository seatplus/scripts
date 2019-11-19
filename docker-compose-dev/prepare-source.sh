#!/bin/bash

echo "Generating an SSL certificate..."

openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -config ./openssl.cnf -outform PEM -out ./fullchain.pem -keyout ./privkey.pem

echo "Pulling sources..."

git clone https://github.com/seatplus/core seatplus && cd seatplus
#cp ../composer.json composer.json

mkdir -p packages/seatplus && cd packages/seatplus
git clone https://github.com/seatplus/web
git clone https://github.com/seatplus/eveapi
git clone https://github.com/seatplus/auth

echo "Done! docker-compose up now!"