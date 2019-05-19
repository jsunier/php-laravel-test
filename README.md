# jsunier/php-laravel-test

Docker image to run PHPUnit with Laravel on PHP 7.1/7.2/7.3.

The image is published on the [Docker Hub](https://hub.docker.com) at this address : https://hub.docker.com/r/jsunier/php-laravel-test.

This image contains multiple versions available for testing your code with PHPUnit and Laravel.

# Usage

## Informations

For now, there is only one available database adapters for the available PHP versions:

* MySQL/MariaDB

Every images include the latest version of [composer](https://getcomposer.org).

List of PHP extensions installed:

| Extension / PHP version | 7.1 | 7.2 | 7.3 |
|-------------------------|:---:|:---:|:---:|
| `mbstring`              |  ✅  |  ✅  |  ✅  |
| `zip`                   |  ✅  |  ✅  |  ✅  |
| `iconv`                 |  ✅  |  ✅  |  ✅  |
| `opcache`               |  ✅  |  ✅  |  ✅  |
| `bcmath`                |  ✅  |  ✅  |  ✅  |
| `pdo_mysql`             |  ✅  |  ✅  |  ✅  |
| `pdo`                   |  ✅  |  ✅  |  ✅  |
| `imagick`               |  ✅  |  ✅  |  ✅  |
| `gd`                    |  ❌  |  ❌  |  ❌  |
| `mcrypt`                |  ❌  |  ❌  |  ❌  |
| `oci8`                  |  ❌  |  ❌  |  ❌  |
| `postgresql`            |  ❌  |  ❌  |  ❌  |
| `redis`                 |  ❌  |  ❌  |  ❌  |

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
*
## PHP7.3

* amd64 : `jsunier/php-laravel-test:7.3-mysql` or `jsunier/php-laravel-test:7.3-mariadb`
* arm32v7 : `jsunier/php-laravel-test:7.3-mysql-arm32v7` or `jsunier/php-laravel-test:7.3-mariadb-arm32v7`

# Default configurations

Default value in Dockerfile's directives:

| Directive | Value                                                     |
|-----------|-----------------------------------------------------------|
| `WORKDIR` | `/app`                                                    |
| `VOLUME`  | `[ "/app" ]`                                              |
| `EXPOSE`  | `8000`                                                    |
| `CMD`     | `[ "php", "/app/artisan", "serve", "--host", "0.0.0.0" ]` |

# Build

To build these images, just go into the folder of you choice and run `docker build . -t <your-image-name:your-tag>`.

Example:
```
# cd amd64/php7.1/mysql
# docker build . -t my-awesome-phpunit-image
```
