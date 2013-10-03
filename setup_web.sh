#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

# install apache'n'friends
sudo apt-get -y install apache2 php5 libapache2-mod-php5

# mysql-server mysql-client php5 php5-mysql php5-curl php5-gd php-apc

sudo a2enmod rewrite
sudo a2enmod expires
sudo a2enmod headers
sudo a2enmod deflate
sudo mkdir -p /var/www

echo "<?php phpinfo()?>" > /var/www/test.php
echo "<html><body><h2>It seems to be working!</h2></body></html>" > /var/www/test.html

# install wordpress


# chown
sudo chown -R www-data:www-data /var/www
