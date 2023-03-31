FROM php:7.4-fpm

RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    libzip-dev \
    libonig-dev \
    libpng-dev \
    libxml2-dev \
    zip \
    curl \
    git \
    supervisor

RUN docker-php-ext-install \
    pdo \
    pdo_pgsql \
    gd \
    zip \
    mbstring \
    exif \
    pcntl \
    bcmath \
    opcache \
    calendar \
    sockets \
    xml

RUN pecl install redis && docker-php-ext-enable redis

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g npm

WORKDIR /var/www/html/app

CMD ["php-fpm"]

EXPOSE 9000