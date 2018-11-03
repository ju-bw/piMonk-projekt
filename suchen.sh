#!/bin/bash -e
# chmod a+x *.sh
# ./script.sh
# % ju -- https://bw1.eu -- 3-11-18
# update:   
#==================================

find /home/pi -name h*llo.py 2>/dev/null

history | grep *.py > history.txt

# alle py Dateien finden, die im Oktober zuletzt modifiziert wurden
# Bsp. ls -l => -rwxr-xr-x 1 pi pi  44 Okt 30 21:32 hello.py
ls -l *.py | grep Okt

# Informationen zur Prozessor- und Speicherauslastung
top

# Prozess-ID des CPU-fressenden Python-Prozesses zu ermitteln
ps -ef | grep "python"

# Prozess beenden
#sudo kill "Prozess-ID"