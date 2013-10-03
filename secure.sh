#!/bin/bash

PASS=`cat /dev/urandom | tr -dc A-Za-z0-9 | head -c 10`
sudo useradd -s /bin/bash -d /home/$EC_USERNAME -m -p `openssl passwd -1 $PASS` $EC_USERNAME
sudo adduser $EC_USERNAME admin
sudo cp /etc/sudoers /tmp
sudo chmod 666 /tmp/sudoers 
sudo echo "$EC_USERNAME ALL=(ALL) NOPASSWD:ALL" >> /tmp/sudoers
sudo chmod 440 /tmp/sudoers 
sudo mv /tmp/sudoers /etc

cd ~$EC_USERNAME
sudo su $EC_USERNAME


git clone https://github.com/mvkvl/bootstrap.git
ln -sb bootstrap/.screenrc .
ln -sb bootstrap/.bash_profile .
ln -sb bootstrap/.bashrc .
ln -sb bootstrap/.bashrc_custom .
ln -sb bootstrap/.bash_colors .
ln -sf bootstrap/.emacs.d .

mkdir .ssh
chmod -R 700 .ssh
sudo cp ~ubuntu/.ssh/authorized_keys ~/.ssh
sudo chown -R `whoami`:`whoami` ~/.ssh

sudo cp /etc/ssh/sshd_config /tmp
sudo chmod a+rw /tmp/sshd_config
sudo echo "AllowUsers $USER" >> /tmp/sshd_config
sudo chmod 655 /tmp/sshd_config
sudo mv /tmp/sshd_config /etc/ssh
sudo service ssh restart
exit

