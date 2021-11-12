FROM certbot/certbot

COPY entrypoint.sh /usr/bin/local/certbot-entrypoint.sh

ENTRYPOINT ["/usr/bin/local/certbot-entrypoint.sh"]