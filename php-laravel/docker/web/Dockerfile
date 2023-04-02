FROM php:8.2-apache
EXPOSE 5173

# SSL設定
COPY /docker/web/ssl/server.crt /etc/ssl/certs/
COPY /docker/web/ssl/server.key /etc/ssl/private/
RUN sed -i -e 's/\/etc\/ssl\/certs\/ssl\-cert\-snakeoil\.pem/\/etc\/ssl\/certs\/server\.crt/' \
    -i -e 's/\/etc\/ssl\/private\/ssl\-cert\-snakeoil\.key/\/etc\/ssl\/private\/server\.key/' \
    -i -e 's/\/var\/www\/html/\/var\/www\/html\/public/' \
    /etc/apache2/sites-available/default-ssl.conf
RUN a2enmod ssl \
    && a2ensite default-ssl.conf

COPY /docker/web/php.ini /usr/local/etc/php/

# rewrite有効
RUN ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load

# バーチャルホスト設定（localhost以外にする場合）
# COPY /docker/web/httpd/*.conf /etc/apache2/sites-available/

RUN apt-get update \
    && apt-get install -y zlib1g-dev libzip-dev unzip \
    # ファイルアップロードが必要な場合
    # && libpng-dev libjpeg62-turbo-dev libfreetype6-dev \
    # && docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ \
    # && docker-php-ext-install -j$(nproc) gd exif
    && docker-php-ext-install zip pdo_mysql \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug

# Composer install
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Node.js install
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs \
    && apt-get update