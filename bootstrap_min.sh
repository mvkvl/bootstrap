#!/bin/bash

echo
echo "*********************************"
echo "*                               *"
echo "*   RUNNING BOOTSTRAP MINIMAL   *"
echo "*                               *"
echo "*********************************"
echo

sleep 3
sudo apt-get -y dist-upgrade
sudo apt-get update
sudo apt-get -y upgrade
curl https://raw.github.com/mvkvl/bootstrap/master/setup_common.sh | bash
