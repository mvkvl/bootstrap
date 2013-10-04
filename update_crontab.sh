#!/bin/bash

echo 
echo "-------- crontab update ----------"
echo $HOME
echo $DYNDNS_UPDATE_CMD
echo

# update crontab for FreeDNS
if [ false ]; then
  echo "$DYNDNS_UPDATE_CMD" > $HOME/dns-update.sh
  chmod +x $HOME/dns-update.sh
  cp /etc/crontab /tmp
  sudo chmod 666 /tmp/crontab
  chattr -i /tmp/crontab
  echo ""  >> /tmp/crontab
  echo "# update FreeDNS every 5 minutes" >> /tmp/crontab
  echo "*/5 * * * * $USER $HOME/dns-update.sh" >> /tmp/crontab
  sudo chmod 644 /tmp/crontab
  chattr +i /tmp/crontab
  sudo mv /tmp/crontab /etc
fi