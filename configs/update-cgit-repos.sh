#!/bin/bash

mkdir -p /home/val/temp/cgitrepos

FILE=/home/val/temp/cgitrepos/cgitrepos
if [[ -f "$FILE" ]]; then
  echo "$FILE exists."
else
  cd /home/val/temp
  sudo rm -rf ./cgitrepos
  sudo git clone /home/git2/cgitrepos.git
fi

cd /home/val/temp/cgitrepos
sudo git pull origin master
sudo cp /home/val/temp/cgitrepos/cgitrepos /home/git2/
sudo chown git2:git2 /home/git2/cgitrepos
sudo chgrp git2 /home/git2/cgitrepos
sudo chmod a+r /home/git2/cgitrepos
sudo systemctl restart lighttpd && sudo systemctl restart varnish

echo "Done!"
exit 0
