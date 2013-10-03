#!/bin/bash

echo "SECURE USERNAME = $USERNAME"

sudo adduser $USERNAME
sudo adduser $USERNAME admin
sudo echo "$USERNAME ALL=(ALL) NOPASSWD:ALL"
sudo su $USERNAME
mkdir ~/.ssh
sudo cp ~ubuntu/.ssh/authorized_keys ~/.ssh
sudo chmod -R 700 ~/.ssh
sudo chown -R $USERNAME ~/.ssh
sudo echo "AllowUsers $USERNAME" >> /etc/ssh/sshd_config
sudo service ssh restart
