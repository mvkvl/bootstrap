#!/bin/bash

#echo 
echo "-------- crontab update ----------"
echo $HOME
#echo $DYNDNS_UPDATE_CMD
#echo

# update crontab for FreeDNS

# sudo chattr -i /tmp/dns-update

  set +o noclobber
  #sudo touch /tmp/dns-update
  sudo echo "#!/bin/bash"  > /tmp/dns-update  
  sudo echo "$DYNDNS_UPDATE_CMD" >> /tmp/dns-update  
  sudo chmod +x /tmp/dns-update
  sudo cp /tmp/dns-update /etc/cron.hourly/

#  cp /etc/crontab /tmp
#  sudo chmod 666 /tmp/crontab
#  sudo chattr -i /tmp/crontab
#  sudo echo ""  >> /tmp/crontab
#  sudo echo "# update FreeDNS every 5 minutes" >> /tmp/crontab
#  sudo echo "*/5 * * * * $USER $HOME/dns-update.sh" >> /tmp/crontab
#  sudo chmod 644 /tmp/crontab
#  sudo mv /tmp/crontab /etc
