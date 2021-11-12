#!/usr/bin/env sh

pwd

ls

mkdir -p /var/www

certbot certonly --noninteractive --webroot -w /var/www -d webrequest.javanile.org --agree-tos -m bianco@javanile.org

ls -l /var/www

cat /var/log/letsencrypt/letsencrypt.log
