#!/bin/bash

# Install Composer dependencies
composer install --no-dev --optimize-autoloader

# Install NPM dependencies and build assets
npm install
npm run build

# Create database directory and file
mkdir -p /tmp
touch /tmp/database.sqlite

# Run migrations
php artisan migrate --force

# Clear and cache configurations
php artisan config:clear
php artisan config:cache
php artisan route:clear
php artisan route:cache
php artisan view:clear
php artisan view:cache

# Generate application key if not set
if [ -z "$APP_KEY" ]; then
    php artisan key:generate
fi

echo "Vercel build completed successfully!"
