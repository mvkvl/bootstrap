#!/bin/bash

# install git
sudo apt-get install -y git-core

# git pull and install dotfiles as well
cd $HOME
if [ -d ./startup/ ]; then
    mv startup startup.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi

git clone https://github.com/mvkvl/bootstrap.git
bootstrap/setup_common.sh
bootstrap/setup_dev.sh
