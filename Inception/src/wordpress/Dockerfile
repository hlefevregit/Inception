FROM php:8.2-fpm-alpine

# Install WP-CLI dependencies and tools
RUN apk add --no-cache bash less curl mariadb-client

# Create WordPress directory and set permissions
RUN mkdir -p /var/www/html && chown -R www-data:www-data /var/www/html
WORKDIR /var/www/html

# Install PHP extensions for WordPress
RUN apk add --no-cache $PHPIZE_DEPS \
    libzip-dev libpng-dev libjpeg-turbo-dev libwebp-dev freetype-dev \
    icu-dev zip curl && \
    docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp && \
    docker-php-ext-install -j$(nproc) gd mysqli intl zip

# Install WP-CLI
ENV WP_CLI_VERSION=2.11.0
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# Configure PHP memory limit
RUN echo "memory_limit = 512M" > /usr/local/etc/php/conf.d/memory-limit.ini

# 🔧 Set php-fpm to listen on 0.0.0.0:9000 (instead of default 127.0.0.1)
RUN sed -i 's/^listen = .*/listen = 0.0.0.0:9000/' /usr/local/etc/php-fpm.d/www.conf

# Copy entrypoint script and make executable
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Entrypoint & CMD
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["php-fpm"]

# Volume
VOLUME /var/www/html
