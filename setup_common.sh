#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo apt-add-repository -y ppa:cassou/emacs
sudo apt-get update
sudo apt-get install -y emacs24 emacs24-el emacs24-common-non-dfsg

# make links for dotfiles
ln -sb bootstrap/.screenrc .
ln -sb bootstrap/.bash_profile .
ln -sb bootstrap/.bashrc .
ln -sb bootstrap/.bashrc_custom .
ln -sb bootstrap/.bash_colors .
ln -sf bootstrap/.emacs.d .

sudo apt-get -y install htop mc
