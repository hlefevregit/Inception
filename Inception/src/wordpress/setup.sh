#!/bin/bash
set -e

echo "⏳ Attente de la base de données..."
while ! mysqladmin ping -h"$WORDPRESS_DB_HOST" --silent; do
    sleep 2
done
echo "✅ Base de données prête !"

wp core install --allow-root \
    --url="https://${DOMAIN_NAME}" \
    --title="Mon WordPress" \
    --admin_user="${WP_ADMIN_USER}" \
    --admin_password="${WP_ADMIN_PASS}" \
    --admin_email="${WP_ADMIN_EMAIL}" \
    --path=/var/www/html

wp user create ${WP_USER} ${WP_USER_EMAIL} --role=editor --user_pass="${WP_USER_PASS}" --allow-root --path=/var/www/html

echo "🎉 WordPress est prêt !"

exec php-fpm
