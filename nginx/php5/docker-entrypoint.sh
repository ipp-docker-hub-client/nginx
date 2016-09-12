#!/bin/bash

if [ -z "$nginx_port" ]; then
    sed -i 's/listen\s*80;/listen '"$nginx_port"';/g' /etc/nginx/conf.d/default.conf
fi  

if [[ "$1" == nginx ]] || [ "$1" == php-fpm ]; 
then
  mkdir /var/www/html
  echo "<?php phpinfo(); ?>" > /var/www/html/info.php
  chown -R 0:0 /var/www/html
  echo "Running PHP-FPM ..."
  php-fpm --allow-to-run-as-root --nodaemonize &
  echo "Running Nginx ..."
  nginx -g 'daemon off;'
else
 exec "$@"
fi
