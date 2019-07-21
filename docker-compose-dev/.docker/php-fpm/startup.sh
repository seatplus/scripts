#!/bin/sh
set -e

# Ensure we have vendor/ ready
while [ ! -f /var/www/vendor/autoload.php ]
do
    echo "Eveapi App container might not be ready yet... sleeping..."
    sleep 30

done

php-fpm -F
