#!/bin/sh
echo "Running PHP-FPM ..."
php-fpm
echo "Running Nginx ..."
nginx -g 'daemon off;'
