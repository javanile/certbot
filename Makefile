
build:
	@chmod +x entrypoint.sh
	@docker build -t javanile/certbot .

test: build
	@echo
	@echo "====[ TEST ]===="
	@mkdir -p cert
	@chmod 777 cert
	@docker run --rm -ti \
		-p 80:80 -p 443:443 \
		-v "$(PWD)/cert:/cert" \
		javanile/certbot webrequest.javanile.org
