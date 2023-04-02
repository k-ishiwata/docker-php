#!/bin/sh

# SSLキーを生成
cd `dirname $0`
cd ../docker/web/ssl

openssl genrsa -aes128 2048 > server.key

openssl req -new -key server.key <<EOF > server.csr
JP
Tokyo
Town
Company
Section
Name



EOF

openssl x509 -in server.csr -days 36500 -req -signkey server.key > server.crt

mv server.key server.key.org
openssl rsa -in server.key.org > server.key
rm server.key.org
rm server.csr