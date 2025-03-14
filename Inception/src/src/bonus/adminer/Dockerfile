FROM alpine:3.20

RUN apk update && \
  	apk add --no-cache \
	curl \
	less \
	mariadb-client \
	php83 \
	php83-fpm \
	php83-common \
	php83-session \
	php83-iconv \
	php83-json \
	php83-gd \
	php83-curl \
	php83-xml \
	php83-mysqli \
	php83-imap \
	php83-pdo \
	php83-pdo_mysql \
	php83-soap \
	php83-posix \
	php83-gettext \
	php83-ldap \
	php83-ctype \
	php83-dom \
	php83-simplexml


RUN \
	curl -L -O https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php && \
	mkdir -p /var/www/html && \
	mv ./adminer-4.8.1.php /var/www/html/index.php && \
	adduser -u 82 -D -S -G www-data www-data

COPY /conf/www.conf /etc/php83/php-fpm.d/www.conf

EXPOSE 9000
STOPSIGNAL SIGQUIT

CMD ["php-fpm83", "--nodaemonize"]