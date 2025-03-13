#!/bin/sh

sleep 5

echo "MariaDB is up"

echo "Wordpress setup..."

echo "$DOMAIN_NAME"
echo "${MYSQL_DATABASE}"
if [ ! -f "/wp-config.php" ];
then
    sed -i 's/memory_limit = 128M/memory_limit = 512M/' /etc/php83/php.ini
    wp core download \
        --path="/var/www/html"
    cd /var/www/html
    wp config create \
        --allow-root \
        --dbname="${MYSQL_DATABASE}" \
        --dbuser="${MYSQL_USER}" \
        --dbpass="${MYSQL_PASSWORD}" \
        --dbhost=mariadb:3306 \
        --dbcharset="utf8" \
        --dbcollate="utf8_general_ci" \
        --path="/var/www/html"
    wp core install \
        --url="${DOMAIN_NAME}" \
        --title="inception" \
        --admin_user="${WP_ADMIN_USER}" \
        --admin_password="${WP_ADMIN_PASS}" \
        --admin_email="${WP_ADMIN_EMAIL}"
    wp user create \
        "${WP_USER}" \
        "${WP_USER_EMAIL}" \
        --user_pass="${WP_USER_PASS}" \
        --role=author
fi

chmod -R 755 /var/www/html

echo "Wordpress setup completed"

echo "Starting php-fpm83..."
exec php-fpm83 -F -R # Start PHP-FPM