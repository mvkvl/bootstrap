#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

if [ -z $MYSQL_ADMIN_PASSWORD ]; then
  echo "***********************************************"
  echo "*                                             *"
  echo "* MYSQL_ADMIN_PASSWORD not set, can't proceed *"
  echo "*                                             *"
  echo "***********************************************"
  exit 1;
fi 

# install apache'n'friends
sudo apt-get -q -y install apache2 php5 libapache2-mod-php5
sudo a2enmod rewrite
sudo a2enmod expires
sudo a2enmod headers
sudo a2enmod deflate
sudo mkdir -p /var/www

# install mysql
sudo echo "mysql-server mysql-server/root_password password $MYSQL_ADMIN_PASSWORD" | sudo debconf-set-selections
sudo echo "mysql-server mysql-server/root_password_again password $MYSQL_ADMIN_PASSWORD" | sudo debconf-set-selections
sudo apt-get -q -y install mysql-server mysql-client php5-mysql libapache2-mod-auth-mysql

# install wordpress


# chown
echo "<?php phpinfo()?>" > /tmp/test.php
echo "<html><body><h2>It seems to be working!</h2></body></html>" > /tmp/test.html
sudo mv /tmp/test.php  /var/www
sudo mv /tmp/test.html /var/www

sudo chown -R www-data:www-data /var/www
