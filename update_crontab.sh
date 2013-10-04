#!/bin/bash

#echo 
echo "-------- crontab update ----------"
echo $HOME
#echo $DYNDNS_UPDATE_CMD
#echo

# update crontab for FreeDNS
  set +o noclobber
  sudo echo "#!/bin/bash"  > /tmp/dns-update  
  sudo echo "$DYNDNS_UPDATE_CMD" >> /tmp/dns-update  
  sudo chmod +x /tmp/dns-update
  sudo cp /tmp/dns-update /etc/cron.hourly/
