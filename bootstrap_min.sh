#!/bin/bash

echo
echo "*********************************"
echo "*                               *"
echo "*   RUNNING BOOTSTRAP MINIMAL   *"
echo "*                               *"
echo "*********************************"
echo

sleep 3
curl https://raw.github.com/mvkvl/bootstrap/master/setup_common.sh | bash
