FROM php:8.1-fpm

# Install package
RUN apt-get update
RUN apt-get install vim git zip unzip libpng-dev libzip-dev librabbitmq-dev libicu-dev cron -y

# Database
RUN docker-php-ext-install pdo_mysql zip bcmath gd

# Excel
RUN apt-get install zlib1g-dev libpng-dev libxml2-dev -y
RUN docker-php-ext-install zip
RUN docker-php-ext-install gd
RUN docker-php-ext-install xml

# Pcntl
RUN docker-php-ext-install pcntl

# Socket
RUN docker-php-ext-install sockets

# Xdebug
#RUN pecl install xdebug \
#    && docker-php-ext-enable xdebug \
#    && echo "xdebug.mode=develop,debug" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
#    && echo "xdebug.client_host=host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
#    && echo "xdebug.discover_client_host=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# Timezone
RUN echo "date.timezone = Asia/Ho_Chi_Minh" >> /usr/local/etc/php/php.ini
RUN echo "upload_max_filesize = 1024M" >> /usr/local/etc/php/php.ini
RUN echo "post_max_size = 1024M" >> /usr/local/etc/php/php.ini
RUN echo "error_log = /var/log/php/php-fpm.log" >> /usr/local/etc/php/php.ini
RUN echo "log_errors = On" >> /usr/local/etc/php/php.ini
RUN echo "log_level = alert" >> /usr/local/etc/php/php.ini
RUN echo "output_buffering = 4096" >> /usr/local/etc/php/php.ini
RUN echo "memory_limit = 256M" >> /usr/local/etc/php/php.ini

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN mkdir -p /var/www/code
# Copy code
COPY ./code /var/www/code
# Permission
RUN chmod -R 777 /var/www/

# Tạo một người dùng không phải root
RUN useradd -ms /bin/bash myuser
# Thay đổi sở hữu của thư mục làm việc
RUN chown -R myuser:myuser /var/www/code
# Chuyển đổi sang người dùng không phải root
USER myuser
RUN cd /var/www/code \
    rm -rf vendor \
    composer install

WORKDIR /var/www

CMD ["php-fpm"]

EXPOSE "9000"
