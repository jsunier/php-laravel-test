FROM arm32v7/php:7.2-cli

LABEL maintainer="Joël Sunier <jsunier@stogon.io>" \
    php.version="7.2" \
    php.pdo_connector="MySQL" \
    os.architecture="arm32v7"

RUN apt-get update && \
    apt-get install -yqq unzip git curl libmcrypt-dev libjpeg-dev zlib1g-dev libpng-dev libfreetype6-dev libbz2-dev libxml2-dev libpq-dev && \
    docker-php-ext-install mbstring pdo_mysql zip iconv opcache gd && \
    apt-get clean

COPY --from=arm32v7/composer /usr/bin/composer /usr/bin/composer

WORKDIR /app

VOLUME [ "/app" ]

# Create a "laravel" user
RUN groupadd --gid 1000 laravel \
  && useradd --uid 1000 --gid laravel --shell /bin/bash --create-home laravel

# Fix permissions issues
RUN chmod -R a+wrx /app

EXPOSE 8000

USER laravel
RUN composer global require --no-interaction --no-progress hirak/prestissimo:0.3.10

CMD [ "php", "/app/artisan", "serve", "--host", "0.0.0.0" ]
