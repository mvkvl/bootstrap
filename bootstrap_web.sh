#!/bin/bash

echo
echo "*********************************"
echo "*                               *"
echo "*     RUNNING BOOTSTRAP WEB     *"
echo "*                               *"
echo "*********************************"
echo

export DEBIAN_FRONTEND=noninteractive

sleep 3
sudo apt-get -q -y dist-upgrade
sudo apt-get update
sudo apt-get -q -y upgrade
curl https://raw.github.com/mvkvl/bootstrap/master/setup_common.sh | bash
curl https://raw.github.com/mvkvl/bootstrap/master/setup_web.sh | bash
sudo apt-get -q -y autoremove

echo
echo "Wordpress credentials"
echo "    db: wordpress"
echo "  user: wordpress"
echo "  pass: $WP_DB_PASS"
echo 

sudo reboot
