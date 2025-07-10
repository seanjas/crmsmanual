#!/bin/bash

# Set environment variables
export APP_ENV=production
export APP_DEBUG=false

# Generate key if not exists
if [ -z "$APP_KEY" ]; then
    php artisan key:generate
fi

# Clear and cache configurations
php artisan config:clear
php artisan config:cache
php artisan route:clear
php artisan route:cache
php artisan view:clear
php artisan view:cache

# Start the server
echo "Starting Laravel server on 0.0.0.0:$PORT"
php artisan serve --host=0.0.0.0 --port=$PORT
