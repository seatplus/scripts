FROM php:7.4-alpine

RUN apk add --no-cache git zip unzip curl \
    libpng-dev bzip2-dev icu-dev && \
    docker-php-ext-install pdo_mysql gd bz2 intl pcntl

ENV PHPREDIS_VERSION 5.1.1

RUN mkdir -p /usr/src/php/ext/redis \
    && curl -L https://github.com/phpredis/phpredis/archive/$PHPREDIS_VERSION.tar.gz | tar xvz -C /usr/src/php/ext/redis --strip 1 \
    && echo 'redis' >> /usr/src/php-available-exts \
    && docker-php-ext-install redis

VOLUME /var/www
WORKDIR /var/www

COPY startup.sh /root/startup.sh
RUN chmod +x /root/startup.sh

ENTRYPOINT ["/bin/sh", "/root/startup.sh"]