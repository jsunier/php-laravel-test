FROM arm32v7/php:7.1-cli

LABEL maintainer="Joël Sunier <jsunier@stogon.io>" \
    php.version="7.1" \
    php.pdo_connector="MySQL" \
    os.architecture="arm32v7"

RUN apt-get update && \
    apt-get install -yqq git curl libmcrypt-dev libjpeg-dev zlib1g-dev libpng-dev libfreetype6-dev libbz2-dev libxml2-dev libpq-dev && \
    docker-php-ext-install mbstring pdo_mysql zip iconv opcache gd && \
    apt-get clean

RUN curl --silent --show-error https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /app

VOLUME [ "/app" ]

EXPOSE 8000

CMD [ "php", "/app/artisan", "serve", "--host", "0.0.0.0" ]