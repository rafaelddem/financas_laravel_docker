FROM php:8.3-fpm

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \ 
    git unzip mariadb-client \ 
    libpng-dev libonig-dev libxml2-dev \ 
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd \ 
    && rm -rf /var/lib/apt/lists/*

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

RUN git config --global user.name "Rafael" \
    && git config --global user.email "rafaelddem@gmail.com"

RUN git clone -b main https://github.com/rafaelddem/Financas_laravel.git /var/www/html

RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache \
    && chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

WORKDIR /var/www/html

RUN composer update --no-dev --optimize-autoloader
# RUN composer install --no-dev --optimize-autoloader

RUN chown -R www-data:www-data storage bootstrap/cache \
    && chmod -R 775 storage bootstrap/cache

RUN cp .env.example .env && php artisan key:generate

CMD ["php-fpm"]
