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
sudo apt-get -qy dist-upgrade
sudo apt-get update
sudo apt-get -qy upgrade
curl https://raw.github.com/mvkvl/bootstrap/master/setup_common.sh | bash
curl https://raw.github.com/mvkvl/bootstrap/master/setup_web.sh | bash
sudo apt-get -qy autoremove
sudo reboot
