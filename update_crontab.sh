#!/bin/bash

echo "-------- crontab update ----------"
echo $HOME
#echo $DYNDNS_UPDATE_CMD

# update crontab for FreeDNS
  set +o noclobber
  sudo echo "#!/bin/bash"  > /tmp/dns-update  
  sudo echo "$DYNDNS_UPDATE_CMD" >> /tmp/dns-update  
  sudo chmod +x /tmp/dns-update
  sudo mv /tmp/dns-update $HOME

  sudo cp /etc/crontab /tmp
  sudo echo "" >> /tmp/crontab
  sudo echo "# update FreeDNS every 5 minutes" >> /tmp/crontab
  sudo echo "*/5 *   * * *   kami    /home/kami/work/scripts/freedns.update" >> /tmp/crontab
  sudo mv /tmp/crontab /etc/

  echo "----- crontab ------"
  cat /etc/crontab
  echo
  echo "HOME = $HOME"
  cat $HOME/dns-update
