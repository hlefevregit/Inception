FROM alpine:3.18

RUN apk update && apk add --no-cache \
    php81 \
    php81-mysqli \
    php81-session \
    php81-openssl \
    php81-pdo_mysql \
    php81-mbstring \
    php81-json \
    php81-curl \
    php81-dom \
    php81-simplexml \
    curl

WORKDIR /var/www/html

RUN curl -o index.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php

RUN curl -o adminer.css https://raw.githubusercontent.com/pematon/adminer-theme/master/adminer.css

RUN chmod 644 /var/www/html/index.php /var/www/html/adminer.css

EXPOSE 8080
CMD ["php81", "-S", "0.0.0.0:8080", "-t", "/var/www/html"]
