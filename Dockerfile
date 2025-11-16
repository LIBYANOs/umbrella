FROM php:8.3-cli

# تركيب الملحقات
RUN apt-get update && apt-get install -y \
    unzip libzip-dev libicu-dev git \
    && docker-php-ext-install zip pdo pdo_mysql intl

# تركيب Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /app
COPY . .
RUN composer install --no-dev --ignore-platform-req=ext-intl

EXPOSE 10000
CMD php artisan serve --host=0.0.0.0 --port=10000
E
RUN composer install --no-dev --ignore-platform-req=ext-intl

EXPOSE 10000
CMD php artisan serve --host=0.0.0.0 --port=10000
EOFRUN composer install --no-dev --ignore-platform-req=ext-intl

EXPOSE 10000
CMD php artisan serve --host=0.0.0.0 --port=10000
