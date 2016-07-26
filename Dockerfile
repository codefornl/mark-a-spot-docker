# from https://www.drupal.org/requirements/php#drupalversions
FROM drupal:7.50-apache

# install the PHP extensions we need
RUN apt-get update && apt-get install -y git drush zip unzip

WORKDIR /var/www/html

EXPOSE 80

RUN git clone --recursive https://github.com/codefornl/mark-a-spot.git /mark-a-spot
RUN cp -r /mark-a-spot/* /var/www/html
