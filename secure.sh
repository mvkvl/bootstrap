#!/bin/bash

echo "******************************************************"
echo "*                                                    *"
echo "*  EC_USERNAME = $EC_USERNAME                        *"
echo "*                                                    *"
echo "******************************************************"

PASS=`cat /dev/urandom | tr -dc A-Za-z0-9 | head -c 10`
sudo useradd -s /bin/bash -d /home/$EC_USERNAME -m -p `openssl passwd -1 $PASS` $EC_USERNAME
sudo adduser $EC_USERNAME admin
echo -n "changing sudoers..."
sudo cp /etc/sudoers /tmp
sudo chmod 666 /tmp/sudoers 
sudo echo "$EC_USERNAME ALL=(ALL) NOPASSWD:ALL" >> /tmp/sudoers
sudo chmod 440 /tmp/sudoers 
sudo mv /tmp/sudoers /etc
echo "done"

cd /home/$EC_USERNAME
#sudo su $EC_USERNAME

sudo git clone https://github.com/mvkvl/bootstrap.git
sudo ln -sb bootstrap/.screenrc .
sudo ln -sb bootstrap/.bash_profile .
sudo ln -sb bootstrap/.bashrc .
sudo ln -sb bootstrap/.bashrc_custom .
sudo ln -sb bootstrap/.bash_colors .
sudo ln -sf bootstrap/.emacs.d .

sudo mkdir .ssh
sudo chmod -R 700 .ssh
sudo cp /home/ubuntu/.ssh/authorized_keys /home/$EC_USERNAME/.ssh
sudo chown -R $EC_USERNAME:$EC_USERNAME /home/$EC_USERNAME

#sudo cp /etc/ssh/sshd_config /tmp
#sudo chmod a+rw /tmp/sshd_config
#sudo echo "AllowUsers $EC_USERNAME" >> /tmp/sshd_config
#sudo chmod 655 /tmp/sshd_config
#sudo mv /tmp/sshd_config /etc/ssh
#sudo service ssh restart
