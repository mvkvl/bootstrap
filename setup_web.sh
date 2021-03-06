#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

echo
echo "*********************************"
echo "*                               *"
echo "*       RUNNING SETUP WEB       *"
echo "*                               *"
echo "*********************************"
echo
sleep 3

if [ -z $MYSQL_ADMIN_PASSWORD ]; then
  echo "***********************************************"
  echo "*                                             *"
  echo "* MYSQL_ADMIN_PASSWORD not set, can't proceed *"
  echo "*                                             *"
  echo "***********************************************"
  sleep 3
  exit 1;
fi 

# install apache'n'friends
sudo apt-get -y install apache2 php5 libapache2-mod-php5
sudo a2enmod rewrite
sudo a2enmod expires
sudo a2enmod headers
sudo a2enmod deflate
sudo mkdir -p /var/www

# install mysql
# http://gercogandia.blogspot.ru/2012/11/automatic-unattended-install-of.html
sudo echo "mysql-server mysql-server/root_password password $MYSQL_ADMIN_PASSWORD" | sudo debconf-set-selections
sudo echo "mysql-server mysql-server/root_password_again password $MYSQL_ADMIN_PASSWORD" | sudo debconf-set-selections
sudo apt-get -y install mysql-server mysql-client php5-mysql libapache2-mod-auth-mysql

# create database
#-mysqladmin --user=root --password=$MYSQL_ADMIN_PASSWORD create wordpress

# create user & database
WP_DB_PASS=`cat /dev/urandom | tr -dc A-Za-z0-9 | head -c 10`
echo  $WP_DB_PASS > /tmp/wp.db.pass
echo "create database wpdb;" > /tmp/database.sql
echo "connect wpdb;" >> /tmp/database.sql
echo "create user 'wordpress'@'localhost' identified by '$WP_DB_PASS';" >> /tmp/database.sql
echo "grant all privileges on wpdb.* to 'wordpress'@'localhost' identified by '$WP_DB_PASS';" >> /tmp/database.sql
echo "flush privileges;" >> /tmp/database.sql
mysql --user=root --password=$MYSQL_ADMIN_PASSWORD < /tmp/database.sql

# install wordpress
if [ -n "$WP_URL" ]; then
  cd /tmp
  wget "$WP_URL" -O wordpress.tar.gz
  #wget http://wordpress.org/latest.tar.gz
  sleep 10
  tar xfvz wordpress.tar.gz
  sudo mv wordpress /var/www

  echo "<VirtualHost *:80>"                 > /tmp/wordpress.apache
  echo "  ServerName $EC_HOSTNAME"         >> /tmp/wordpress.apache
  echo "  DocumentRoot /var/www/wordpress" >> /tmp/wordpress.apache
  echo "  DirectoryIndex index.php"        >> /tmp/wordpress.apache
  echo "  <Directory /var/www/wordpress/>" >> /tmp/wordpress.apache
  echo "    AllowOverride All"             >> /tmp/wordpress.apache
  echo "    Order Deny,Allow"              >> /tmp/wordpress.apache
  echo "    Allow from all"                >> /tmp/wordpress.apache
  echo "  </Directory>"                    >> /tmp/wordpress.apache
  echo "</VirtualHost>"                    >> /tmp/wordpress.apache

  sudo mv /tmp/wordpress.apache /etc/apache2/sites-available/wordpress
  sudo a2ensite wordpress
  sudo service apache2 restart

  # configure wordpress
  cd /var/www
  sudo chmod -R 777 wordpress
fi

# create script for change permissions
#echo "sudo find /var/www/wordpress -type d -exec chmod 755 {} \;"  > /tmp/change.permissions.sh
#echo "sudo find /var/www/wordpress -type f -exec chmod 644 {} \;" >> /tmp/change.permissions.sh
#sudo mv /tmp/change.permissions.sh 

# make test files
echo "<?php phpinfo()?>" > /tmp/test.php
echo "<html><body><h2>It seems to be working!</h2></body></html>" > /tmp/test.html
sudo mv /tmp/test.php  /var/www
sudo mv /tmp/test.html /var/www

# update dynamic dns record
if [ -n "$DYNDNS_UPDATE_CMD" ]; then
  echo "----- do dns update -----"
  set +o noclobber
  echo "#!/bin/bash"         > $HOME/dns-update
  echo "$DYNDNS_UPDATE_CMD" >> $HOME/dns-update
  chmod +x $HOME/dns-update
  $HOME/dns-update
fi

# chown
sudo chown -R www-data:www-data /var/www
