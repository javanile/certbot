
build:
	chmod +x entrypoint.sh
	docker build -t javanile/certbot .
test: build
	docker run --rm -t javanile/certbot
