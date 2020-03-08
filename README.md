# jsunier/php-laravel-test

Docker image to run PHPUnit with Laravel on PHP 7.1/7.2/7.3/7.4.

The image is published on the [Docker Hub](https://hub.docker.com) at this address : https://hub.docker.com/r/jsunier/php-laravel-test.

This image contains multiple versions available for testing your code with PHPUnit and Laravel.

# Usage

## Informations

For now, there is only one available database adapters for the available PHP versions:

* MySQL/MariaDB

Every images include the latest version of [composer](https://getcomposer.org).

List of PHP extensions installed:

| Extension / PHP version | 7.1 | 7.2 | 7.3 | 7.4 |
|-------------------------|:---:|:---:|:---:|:---:|
| `mbstring`              |  ✅  |  ✅  |  ✅  | ✅ |
| `zip`                   |  ✅  |  ✅  |  ✅  | ✅ |
| `iconv`                 |  ✅  |  ✅  |  ✅  | ✅ |
| `opcache`               |  ✅  |  ✅  |  ✅  | ✅ |
| `bcmath`                |  ✅  |  ✅  |  ✅  | ✅ |
| `pdo_mysql`             |  ✅  |  ✅  |  ✅  | ✅ |
| `pdo`                   |  ✅  |  ✅  |  ✅  | ✅ |
| `imagick`               |  ✅  |  ✅  |  ✅  | ✅ |
| `gd`                    |  ✅  |  ✅  |  ✅  | ✅ |
| `mcrypt`                |  ❌  |  ❌  |  ❌  | ❌ |
| `oci8`                  |  ❌  |  ❌  |  ❌  | ❌ |
| `postgresql`            |  ❌  |  ❌  |  ❌  | ❌ |
| `redis`                 |  ❌  |  ❌  |  ❌  | ❌ |

Additionally, there is [hirak/prestissimo](https://packagist.org/packages/hirak/prestissimo) installed in all images to speed up `composer install/update`.

## Architectures available

Images are compiled for these architectures:

* `arm32v7`
* `amd64`

## PHP7.1

### MySQL/MariaDB

* amd64 : `jsunier/php-laravel-test:7.1-mysql` or `jsunier/php-laravel-test:7.1-mariadb`
* arm32v7 : `jsunier/php-laravel-test:7.1-mysql-arm32v7` or `jsunier/php-laravel-test:7.1-mariadb-arm32v7`

## PHP7.2

* amd64 : `jsunier/php-laravel-test:7.2-mysql` or `jsunier/php-laravel-test:7.2-mariadb`
* arm32v7 : `jsunier/php-laravel-test:7.2-mysql-arm32v7` or `jsunier/php-laravel-test:7.2-mariadb-arm32v7`

## PHP7.3

* amd64 : `jsunier/php-laravel-test:7.3-mysql` or `jsunier/php-laravel-test:7.3-mariadb`
* arm32v7 : `jsunier/php-laravel-test:7.3-mysql-arm32v7` or `jsunier/php-laravel-test:7.3-mariadb-arm32v7`

## PHP7.4

* amd64 : `jsunier/php-laravel-test:7.4-mysql` or `jsunier/php-laravel-test:7.4-mariadb` or `jsunier/php-laravel-test:latest-mysql` or `jsunier/php-laravel-test:latest-mariadb`
* arm32v7 : `jsunier/php-laravel-test:7.4-mysql-arm32v7` or `jsunier/php-laravel-test:7.4-mariadb-arm32v7` or `jsunier/php-laravel-test:latest-mysql-arm32v7` or `jsunier/php-laravel-test:latest-mariadb-arm32v7`

# Default configurations

Default value in Dockerfile's directives:

| Directive | Value                                                     |
|-----------|-----------------------------------------------------------|
| `WORKDIR` | `/app`                                                    |
| `VOLUME`  | `[ "/app" ]`                                              |
| `EXPOSE`  | `8000`                                                    |
| `CMD`     | `[ "php", "/app/artisan", "serve", "--host", "0.0.0.0" ]` |

The default user is `laravel`.

# Build

## All at once

There is a `Makefile` available to simplify the creation of theses images.

You can change the values inside this file to set your custom repository, folders, tags, etc.

> You need to have `make` installed (`sudo apt install make`)

### Build AMD (x64)

```
$ make build-amd
$ make push-amd
```

### Build ARM (arm32v7)

```
$ make build-arm
$ make push-arm
```

## Specific container

To build these images, just go into the folder of you choice and run `docker build . -t <your-image-name:your-tag>`.

Example:
```
# cd amd64/php7.4/mysql
# docker build . -t my-awesome-phpunit-image
```
