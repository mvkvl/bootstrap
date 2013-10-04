#!/bin/bash

echo
echo "*********************************"
echo "*                               *"
echo "*     RUNNING BOOTSTRAP WEB     *"
echo "*                               *"
echo "*********************************"
echo

# echo "DYN DNS CMD = $DYNDNS_UPDATE_CMD"

export DEBIAN_FRONTEND=noninteractive

sleep 3
sudo apt-get -y dist-upgrade
sudo apt-get update
sudo apt-get -y upgrade
curl https://raw.github.com/mvkvl/bootstrap/master/setup_common.sh | bash
curl https://raw.github.com/mvkvl/bootstrap/master/setup_web.sh | bash
sudo apt-get -y autoremove

WP_DB_PASS=`cat /tmp/wp.db.pass`
sudo rm /tmp/wp.db.pass
echo
echo "Wordpress credentials"
echo "    db: wpdb"
echo "  user: wordpress"
echo "  pass: $WP_DB_PASS"
echo 

#-echo 
#-echo "will reboot in 60 seconds..."
#-sudo shutdown -r 60 &
