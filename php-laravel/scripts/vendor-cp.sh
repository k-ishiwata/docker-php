#!/bin/sh

# マウントしてないディレクトリをコンテナからコピー
docker compose cp web:/var/www/html/node_modules ./html/
docker compose cp web:/var/www/html/vendor ./html/
