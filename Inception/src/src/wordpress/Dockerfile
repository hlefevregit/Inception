FROM alpine:3.20.0
EXPOSE 9000

RUN apk update
RUN apk add --no-cache \
    wget \
    php83 \
    php83-fpm \
    php83-mysqli \
    php-phar \
    php83-iconv \
    mariadb-client \
    -q


RUN addgroup -g 82 -S www-data || true && adduser -u 82 -D -S -G www-data www-data || true

RUN id www-data


RUN mkdir -p /var/www
RUN chown -R root:root /var/www

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod 755 wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp
RUN rm -rf /var/www/html/wp-config-sample.php

COPY www.conf /etc/php83/php-fpm.d/www.conf

COPY docker-entrypoint.sh /
RUN chmod 755 /docker-entrypoint.sh
CMD [ "/docker-entrypoint.sh" ]