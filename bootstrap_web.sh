#!/bin/bash

echo
echo "*********************************"
echo "*                               *"
echo "*     RUNNING BOOTSTRAP WEB     *"
echo "*                               *"
echo "*********************************"
echo

sleep 3
sudo apt-get -y dist-upgrade
sudo apt-get update
sudo apt-get -y upgrade
curl https://raw.github.com/mvkvl/bootstrap/master/setup_common.sh | bash
curl https://raw.github.com/mvkvl/bootstrap/master/setup_web.sh | bash
sudo apt-get -y autoremove
sudo reboot
