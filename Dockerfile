FROM php:7.0-apache

RUN a2enmod rewrite

# install the PHP extensions we need
RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get -yq install \
    libpng12-dev \
    libjpeg-dev \ 
    libpq-dev \
    drush \
    zip git \
	&& rm -rf /var/lib/apt/lists/* \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
&& docker-php-ext-install gd mbstring pdo pdo_mysql pdo_pgsql

WORKDIR /var/www/html

EXPOSE 80

RUN git clone --recursive https://github.com/codefornl/mark-a-spot.git /mark-a-spot
RUN cp -r /mark-a-spot/* /var/www/html
RUN chown -R www-data:www-data sites
