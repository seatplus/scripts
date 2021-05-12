#
# First we create the vendor folder by using composer to get all php dependencies
#

#FROM composer:1.8.6 as vendor
#
#COPY database/ database/
#
#COPY composer.json composer.json
#COPY composer.lock composer.lock
#
#RUN composer install \
#    --ignore-platform-reqs \
#    --no-interaction \
#    --no-plugins \
#    --no-scripts \
#    --prefer-dist

#
# Frontend
#
#FROM node:12.7.0-alpine as frontend
#
#RUN mkdir -p /app/public
#
#COPY package.json webpack.mix.js /app/
#COPY resources/ /app/resources/
#
#WORKDIR /app
#
#RUN npm install
#RUN npm run development

##
## Application
##
FROM php:8-fpm-alpine as seat-plus

#COPY . /seatplus
#COPY --from=vendor /app/vendor/ /seatplus/vendor/
#COPY --from=frontend /app/public/js/ /seatplus/public/js/
#COPY --from=frontend /app/public/css/ /seatplus/public/css/
#COPY --from=frontend /app/mix-manifest.json /seatplus/mix-manifest.json

COPY startup.sh /root/startup.sh
RUN chmod +x /root/startup.sh

RUN apk add --no-cache \
    # Install OS level dependencies
    git zip unzip curl \
    libpng-dev libzip-dev libmcrypt-dev bzip2-dev icu-dev mariadb-client && \
    # Install PHP dependencies
    docker-php-ext-install pdo_mysql gd bz2 intl pcntl zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin \
    --filename=composer && hash -r

RUN apk add --update nodejs npm

ENV PHPREDIS_VERSION 5.3.2

RUN mkdir -p /usr/src/php/ext/redis \
    && curl -L https://github.com/phpredis/phpredis/archive/$PHPREDIS_VERSION.tar.gz | tar xvz -C /usr/src/php/ext/redis --strip 1 \
    && echo 'redis' >> /usr/src/php-available-exts \
    && docker-php-ext-install redis

#RUN chown -R www-data:www-data storage

VOLUME /var/www
WORKDIR /var/www/core

#RUN chown -R www-data:www-data storage

#
CMD ["php-fpm", "-F"]
#
ENTRYPOINT ["/bin/sh", "/root/startup.sh"]