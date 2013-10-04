#!/bin/bash

echo 
echo "-------- crontab update ----------"
echo $HOME
echo $DYNDNS_UPDATE_CMD
echo

# if [ -n "$DYNDNS_UPDATE_CMD" ]; then
# ...
#fi
# update crontab for FreeDNS
# rm -rf $HOME/dns-update.sh
# echo "$DYNDNS_UPDATE_CMD" > $HOME/dns-update.sh
# chmod +x $HOME/dns-update.sh
# sudo rm -rf /tmp/crontab
# cp /etc/crontab /tmp
# sudo chmod 666 /tmp/crontab
# echo ""  > /tmp/crontab
# echo "# update FreeDNS every 5 minutes" >> /tmp/crontab
# echo "*/5 * * * * $USER $HOME/dns-update.sh" >> /tmp/crontab
# sudo chmod 644 /tmp/crontab
# sudo mv /tmp/crontab /etc
