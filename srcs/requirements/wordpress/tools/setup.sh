#!/bin/bash

set -e

echo "Waiting for MariaDB..."

until mysqladmin ping -h mariadb -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" --silent; do
    sleep 2
done

echo "MariaDB is ready"

# Go to WordPress directory
cd /var/www/html

# Install WordPress only if not installed
if [ ! -f "wp-load.php" ]; then
    echo "Downloading WordPress..."
    wp core download --allow-root
fi

echo "Creating config..."
if [ ! -f "wp-config.php" ]; then
    wp config create \
        --allow-root \
        --dbname="$MYSQL_DATABASE" \
        --dbuser="$MYSQL_USER" \
        --dbpass="$MYSQL_PASSWORD" \
        --dbhost="mariadb"
    echo "Installing WordPress..."
fi
if ! wp core is-installed --allow-root; then
    wp core install \
        --allow-root \
        --url="https://$DOMAIN_NAME" \
        --title="Inception" \
        --admin_user="$WORDPRESS_ADMIN_USER" \
        --admin_password="$WORDPRESS_ADMIN_PASSWORD" \
        --admin_email="$WORDPRESS_ADMIN_EMAIL"
    echo "Creating second user..."
    wp user create  "$WORDPRESS_USER_USER" "$WORDPRESS_USER_EMAIL" \
        --user_pass="$WORDPRESS_USER_PASSWORD" \
        --role=author \
        --allow-root
fi

# Fix permissions (important)
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html
echo "Starting PHP-FPM..."
mkdir -p /run/php
chown -R www-data:www-data /run/php

exec php-fpm7.4 -F