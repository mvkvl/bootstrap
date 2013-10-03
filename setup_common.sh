#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup.

# add 1Gb swap file
# http://www.rownet.co.uk/adding-swap-space-to-an-amazon-ec2-micro-instance/
#sudo dd if=/dev/zero of=/swapfile bs=1M count=1024
#sudo mkswap /swapfile
#sudo swapon /swapfile
#sudo echo "/swapfile  swap      swap    defaults         0 0" > /etc/fstab

# secure an instance (if username is set)
if [ $EC_USERNAME != "ubuntu" ]; then
  bootstrap/secure.sh
else
  cd /home/ubuntu
# make links for dotfiles
  ln -sb bootstrap/.screenrc .
  ln -sb bootstrap/.bash_profile .
  ln -sb bootstrap/.bashrc .
  ln -sb bootstrap/.bashrc_custom .
  ln -sb bootstrap/.bash_colors .
  ln -sf bootstrap/.emacs.d .
fi

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
# sudo apt-add-repository -y ppa:cassou/emacs
# sudo apt-get update
# sudo apt-get install -y emacs24 emacs24-el emacs24-common-non-dfsg
# sudo apt-get -y install htop mc
