#!/bin/bash

# install git
echo "*************************"
echo "*                       *"
echo "*     BOOTSTRAP MIN     *"
echo "*                       *"
echo "*************************"

sudo apt-get install -y git-core
git clone https://github.com/mvkvl/bootstrap.git
#bootstrap/
./setup_common.sh
