#!/bin/bash
set -e

# --- Variables personnalisables ---
WP_SITE_URL="${DOMAIN_NAME}"
ADMIN_USERNAME="${WP_ADMIN_USER}"
ADMIN_PASSWORD="${WP_ADMIN_PASS}"
ADMIN_EMAIL="${WP_ADMIN_EMAIL}"

SECOND_USER_USERNAME="${WP_USER}"
SECOND_USER_PASSWORD="${WP_USER_PASS}"
SECOND_USER_EMAIL="${WP_USER_EMAIL}"
SECOND_USER_ROLE="author"  # other options: author, contributor, subscriber

# --- Installer WordPress si pas déjà installé ---
if ! wp core is-installed --allow-root; then
  echo "📥 Installing WordPress..."
  wp core install \
    --url="$WP_SITE_URL" \
    --title="My WordPress Site" \
    --admin_user="$ADMIN_USERNAME" \
    --admin_password="$ADMIN_PASSWORD" \
    --admin_email="$ADMIN_EMAIL" \
    --skip-email \
    --allow-root
else
  echo "✅ WordPress already installed."
fi

# --- Créer le 2e utilisateur ---
if ! wp user get "$SECOND_USER_USERNAME" --allow-root > /dev/null 2>&1; then
  echo "➕ Creating secondary user..."
  wp user create "$SECOND_USER_USERNAME" "$SECOND_USER_EMAIL" \
    --user_pass="$SECOND_USER_PASSWORD" \
    --role="$SECOND_USER_ROLE" \
    --allow-root
else
  echo "ℹ️ Secondary user already exists."
fi

# --- Activer Redis plugin si WordPress est bien installé
if wp core is-installed --allow-root; then
  echo "🔌 Installing & Enabling Redis Cache plugin..."
  wp plugin install redis-cache --activate --allow-root
  wp config set WP_REDIS_HOST "${REDIS_HOST}" --allow-root
  wp redis enable --allow-root
fi

