#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

# Install nvm: node-version manager
# https://github.com/creationix/nvm
# sudo apt-get install -y git-core
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# setup heroku toolbelt
sudo wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | bash

# create ssh config file
echo "Host heroku.com"              > ~/.ssh/config
echo " HostName heroku.com"        >> ~/.ssh/config
echo " IdentityFile ~/.ssh/rsa_id" >> ~/.ssh/config
echo " IdentitiesOnly yes"         >> ~/.ssh/config
echo ""                            >> ~/.ssh/config
echo "Host github.com"             >> ~/.ssh/config
echo " HostName github.com"        >> ~/.ssh/config
echo " IdentityFile ~/.ssh/rsa_id" >> ~/.ssh/config
echo " IdentitiesOnly yes"         >> ~/.ssh/config
