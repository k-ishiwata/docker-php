#!/bin/sh

mkdir ./html
docker compose up -d
docker compose exec web bash -c "cd /var/www/ && composer create-project --prefer-dist laravel/laravel laravel"
docker compose exec web cp -rf /var/www/laravel/. /var/www/html/
docker compose cp web:/var/www/html/storage ./html/
docker compose cp web:/var/www/html/vendor ./html/
docker compose exec web chmod -R 777 storage
docker compose exec web rm -rf /var/www/laravel
