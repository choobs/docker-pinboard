FROM alpine:3.3
MAINTAINER Erik DeLamarter <erik.delamarter@choobs.com>

RUN apk add --update \
		git \
		php \
		php-apcu \
		php-ctype \
		php-json \
		php-openssl \
		php-pdo_mysql \
		php-phar \
		&& rm -rf /var/cache/apk/*

RUN mkdir /www

VOLUME /www

COPY phps /bin/
COPY router.php /
COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 8080
CMD ["phps"]
