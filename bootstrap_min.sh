#!/bin/bash

# install git
sudo apt-get install -y git-core

echo "USERNAME = $USERNAME"

git clone https://github.com/mvkvl/bootstrap.git

if [ $USERNAME != "ubuntu" ]; then
  bootstrap/secure.sh
fi
