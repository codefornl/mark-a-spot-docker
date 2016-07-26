FROM php:7.0-apache

RUN a2enmod rewrite

# install the PHP extensions we need
RUN apt-get update && apt-get install -y libpng12-dev libjpeg-dev libpq-dev drush \
	&& rm -rf /var/lib/apt/lists/* \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
&& docker-php-ext-install gd mbstring pdo pdo_mysql pdo_pgsql zip

WORKDIR /var/www/html

EXPOSE 80

RUN git clone --recursive https://github.com/codefornl/mark-a-spot.git /mark-a-spot
RUN cp -r /mark-a-spot/* /var/www/html
chown -R www-data:www-data sites
