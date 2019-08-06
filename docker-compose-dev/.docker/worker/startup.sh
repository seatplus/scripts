#!/bin/sh
set -e

cd /var/www

# Ensure we have vendor/ ready
while [ ! -f /var/www/vendor/autoload.php ]
do
    echo "SeAT plus App container might not be ready yet... sleeping..."
    sleep 30
done

php artisan horizon