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
        --url="https://localhost" \
        --title="Inception" \
        --admin_user="badr" \
        --admin_password="badr123" \
        --admin_email="badr@edsad.com"
    echo "Creating second user..."
    wp user create user42 user42@test.com \
        --user_pass="user42pass" \
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