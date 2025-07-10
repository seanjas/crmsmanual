#!/bin/bash

# Create database directory if it doesn't exist
mkdir -p database

# Create SQLite database file
touch database/database.sqlite

# Run migrations
php artisan migrate --force

# Clear and cache config
php artisan config:clear
php artisan config:cache

# Clear and cache routes
php artisan route:clear
php artisan route:cache

# Clear and cache views
php artisan view:clear
php artisan view:cache

# Generate application key if not set
if [ -z "$APP_KEY" ]; then
    php artisan key:generate
fi

# Set proper permissions
chmod -R 775 storage
chmod -R 775 bootstrap/cache

echo "Deployment setup completed!"
