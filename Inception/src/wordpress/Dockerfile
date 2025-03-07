FROM wordpress:php8.2-fpm-alpine

RUN apk add --no-cache php-mysqli \
    php-json \
    php-curl \
    php-gd \
    php-xml \
    php-mbstring \
    php-zip \
    php-soap \
    php-intl \
    php-ldap \
    php-exif \
    php-opcache \
    php-session \
    php-tokenizer \
    php-pecl-imagick \
    bash \
    autoconf \
    g++ \
    make \
    && pecl install redis \
    && docker-php-ext-enable imagick redis


# Copy the custom php.ini file to the container
COPY setup.sh /usr/local/bin/setup
RUN chmod +x /usr/local/bin/setup

# Run the setup script

CMD ["bash", "/usr/local/bin/setup"]

