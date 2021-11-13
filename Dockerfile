FROM certbot/certbot

RUN apk add --no-cache bind-tools curl

COPY entrypoint.sh /usr/bin/local/certbot-entrypoint.sh

VOLUME /cert

ENTRYPOINT ["/usr/bin/local/certbot-entrypoint.sh"]
