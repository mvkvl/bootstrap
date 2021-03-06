#!/bin/bash

echo 
echo "****************************"
echo "*                          *"
echo "*  RUNNING SECURE SCRIPT   *"
echo "*                          *"
echo "****************************"
echo
sleep 3

# create user (with random password)
PASS=`cat /dev/urandom | tr -dc A-Za-z0-9 | head -c 10`
sudo useradd -s /bin/bash -d /home/$EC_USERNAME -m -p `openssl passwd -1 $PASS` $EC_USERNAME
sudo adduser $EC_USERNAME admin

# grant sudo permissions to user
echo -n "changing /etc/sudoers..."
sudo cp /etc/sudoers /tmp
sudo chmod 666 /tmp/sudoers 
sudo echo "$EC_USERNAME ALL=(ALL) NOPASSWD:ALL" >> /tmp/sudoers
sudo chmod 440 /tmp/sudoers 
sudo mv /tmp/sudoers /etc
echo "done"

# setup home directory

cd /home/$EC_USERNAME

sudo git clone https://github.com/mvkvl/bootstrap.git
sudo ln -sb bootstrap/.screenrc .
sudo ln -sb bootstrap/.bash_profile .
sudo ln -sb bootstrap/.bashrc .
sudo ln -sb bootstrap/.bashrc_custom .
sudo ln -sb bootstrap/.bash_colors .
sudo ln -sf bootstrap/.emacs.d .

# add ssh-keys
sudo mkdir .ssh
sudo chmod -R 700 .ssh
sudo cp /home/ubuntu/.ssh/authorized_keys /home/$EC_USERNAME/.ssh
sudo chown -R $EC_USERNAME:$EC_USERNAME /home/$EC_USERNAME
sudo chmod -x /home/$EC_USERNAME/.ssh/authorized_keys

# allow ssh access only for this user
echo -n "changing sshd_config..."
sudo cp /etc/ssh/sshd_config /tmp
sudo chmod a+rw /tmp/sshd_config
sudo echo "AllowUsers $EC_USERNAME" >> /tmp/sshd_config
sudo chmod 655 /tmp/sshd_config
sudo mv /tmp/sshd_config /etc/ssh
sudo service ssh restart
echo "done"
