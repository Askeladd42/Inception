#!/bin/bash

chown -R www-data:www-data /var/www/html/wordpress
exec php-fpm7.3 -F
