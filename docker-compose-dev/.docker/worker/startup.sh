#!/bin/sh
set -e


role=${CONTAINER_ROLE:-worker}

cd /var/www

if [ "$role" = "worker" ]; then
  # Ensure we have vendor/ ready
  while [ ! -f /var/www/vendor/autoload.php ]
  do
      echo "SeAT plus App container might not be ready yet... sleeping..."
      sleep 30
  done

  su www-data -s /bin/sh -c 'php /var/www/artisan horizon'
  

elif [ "$role" = "cron" ]; then

  while [ true ]
  do
      php /var/www/artisan schedule:run --verbose --no-interaction &
      sleep 60
  done

else
    echo "Could not match the container role \"$role\""
    exit 1
fi

