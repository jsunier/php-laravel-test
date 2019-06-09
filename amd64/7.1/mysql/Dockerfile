FROM php:7.1-cli

LABEL maintainer="Joël Sunier <jsunier@stogon.io>" \
    php.version="7.2" \
    php.pdo_connector="MySQL" \
    os.architecture="amd64"

RUN apt-get update && \
    apt-get install -yqq unzip git curl libmcrypt-dev libjpeg-dev zlib1g-dev libpng-dev libfreetype6-dev libbz2-dev libxml2-dev libpq-dev && \
    docker-php-ext-install mbstring pdo_mysql zip iconv opcache gd && \
    apt-get clean

RUN curl --silent --show-error https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /app

VOLUME [ "/app" ]

EXPOSE 8000

CMD [ "php", "/app/artisan", "serve", "--host", "0.0.0.0" ]