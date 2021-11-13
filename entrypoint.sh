#!/usr/bin/env sh
set -e

PUBLIC_IP=$(curl -s ipinfo.io/ip)
DOMAIN=$1

echo "Problem was found, step by step instructions will be provided:"
host -t cname ${DOMAIN}
echo

echo "STEP 1 - Remove the following rule from DNS"
dig +noall +answer ${DOMAIN} CNAME
echo

echo "STEP 2 - Add the following rule on DNS"
echo "${DOMAIN}.       300    IN      A       ${PUBLIC_IP}"
echo

echo "STEP 3 - Waiting for DNS changes..."
while DOMAIN_IP=$(dig +short ${DOMAIN} @8.8.8.8 | head -1) && [ "${DOMAIN_IP}" != "${PUBLIC_IP}" ]; do sleep 30; done
echo "Changes was applied."
echo

echo "Trying SSL certificates"
certbot certonly --dry-run --standalone --noninteractive -d ${DOMAIN} --agree-tos -m bianco@javanile.org && true
if [ $? -eq 0 ]; then
  certbot certonly --dry-run --standalone --noninteractive -d ${DOMAIN} --agree-tos -m bianco@javanile.org
fi

cp /var/log/letsencrypt/letsencrypt.log /cert/letsencrypt.log
chmod 777 -R /cert
