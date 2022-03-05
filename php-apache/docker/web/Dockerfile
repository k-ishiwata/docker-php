FROM php:8.1-apache
COPY /docker/web/php.ini /usr/local/etc/php/

RUN apt-get update \
    && apt-get install -y zlib1g-dev libzip-dev \
    && docker-php-ext-install zip pdo_mysql \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && a2enmod rewrite

# Composerインストール
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /composer
ENV PATH $PATH:/composer/vendor/bin