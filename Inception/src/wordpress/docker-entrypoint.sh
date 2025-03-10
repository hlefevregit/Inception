#!/bin/sh
set -e

# Télécharger WordPress si absent
if [ ! -f /var/www/html/wp-settings.php ]; then
    echo "📥 Téléchargement de WordPress..."
    wp core download --allow-root --path=/var/www/html
fi

# Créer wp-config.php si absent
if [ ! -f /var/www/html/wp-config.php ]; then
    echo "⚙️ Création du fichier wp-config.php..."
    wp config create --allow-root \
        --dbname="${MYSQL_DATABASE}" \
        --dbuser="${MYSQL_USER}" \
        --dbpass="${MYSQL_PASSWORD}" \
        --dbhost="${WORDPRESS_DB_HOST}" \
        --path=/var/www/html
fi

# Installer WordPress si pas encore fait
if ! wp core is-installed --allow-root --path=/var/www/html; then
    echo "🛠 Installation de WordPress..."
    wp core install --allow-root \
        --url="${DOMAIN_NAME}" \
        --title="My WordPress Site" \
        --admin_user="${WP_ADMIN_USER}" \
        --admin_password="${WP_ADMIN_PASS}" \
        --admin_email="${WP_ADMIN_EMAIL}" \
        --path=/var/www/html
fi

# Démarrer php-fpm
exec "$@"
