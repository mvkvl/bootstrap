#!/bin/bash

#echo 
echo "-------- crontab update ----------"
echo $HOME
#echo $DYNDNS_UPDATE_CMD
#echo

# update crontab for FreeDNS
  sudo echo "$DYNDNS_UPDATE_CMD" > /etc/cron.hourly/dns-update  
  sudo chmod +x /etc/cron.hourly//dns-update.sh
#  cp /etc/crontab /tmp
#  sudo chmod 666 /tmp/crontab
#  sudo chattr -i /tmp/crontab
#  sudo echo ""  >> /tmp/crontab
#  sudo echo "# update FreeDNS every 5 minutes" >> /tmp/crontab
#  sudo echo "*/5 * * * * $USER $HOME/dns-update.sh" >> /tmp/crontab
#  sudo chmod 644 /tmp/crontab
#  sudo mv /tmp/crontab /etc
