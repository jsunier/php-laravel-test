FROM php:7.2-cli

MAINTAINER Joël Sunier <jsunier@stogon.io>

RUN apt-get update && \
    apt-get install -yqq git curl libmcrypt-dev libjpeg-dev zlib1g-dev libpng-dev libfreetype6-dev libbz2-dev libxml2-dev libpq-dev && \
    docker-php-ext-install mbstring pdo_mysql zip iconv opcache gd && \
    apt-get clean

RUN curl --silent --show-error https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
