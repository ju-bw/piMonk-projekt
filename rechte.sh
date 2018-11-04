#!/bin/bash -e
# chmod a+x *.sh
# ./script.sh
# % ju -- https://bw1.eu -- 3-11-18
# update:   
#==================================

#clear

echo "* Gruppe ..."
# gruppe 
# sudo addgroup hacker
sudo find . -type d -exec chown pi.root {} +
sudo find . -type f -exec chown pi.root {} +

echo "* Aufraeumen ..."
#Loescht backupdateien ~
sudo find . -name "*~" -exec rm  {} +
sudo find . -name "*.~" -exec rm  {} +

echo "* Berechtigungen ..."
# Berechtigungen fuer Dateien & Verzeichnisse setzen
sudo find . -type d -exec chmod 775 {} +
sudo find . -type f -exec chmod 664 {} +

echo "* Scripte *.sh u. *.py ..."
# scripte ausfuehrbar machen
sudo find . -name "*.sh"  -exec chmod 774 {} +
sudo find . -name "*.py"  -exec chmod 774 {} +

