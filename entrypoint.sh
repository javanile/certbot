#!/usr/bin/env sh

pwd

ls

mkdir -p /var/www

certbot certonly --webroot -w /var/www -d webrequest.javanile.org

cat /var/log/letsencrypt/letsencrypt.log