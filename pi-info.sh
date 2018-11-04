#!/bin/bash -e
# chmod a+x *.sh
# ./script.sh
# % ju -- https://bw1.eu -- 3-11-18
# update:   
#==================================

clear

# Zeit
timestamp=$(date +"%d-%h-%y")
copyright="% ju -- https://bw1.eu -- "
#
piModel=$(cat /proc/device-tree/model  |  tr -d '\0')
piTemp=$(vcgencmd measure_temp |  tr -d '\0')
piMem_arm=$(vcgencmd get_mem arm |  tr -d '\0')
piMem_gpu=$(vcgencmd get_mem gpu |  tr -d '\0')
# host - user - ip
host=$(hostname)
user=$(whoami)
ip=$(ip addr | awk '/inet.[0-9]/&&!/127.0.0.1/ {print $2}')

echo '***********************************************'
echo $copyright $timestamp
echo '*' $piModel
echo '*' $piTemp
echo '* mem_' $piMem_arm
echo '* mem_' $piMem_gpu
echo '* Host: ' $host
echo '* User: ' $user
echo '* IP: ' $ip
echo '* Infos werden im Ordner txt/*.txt gespeichert.'
echo '***********************************************'

echo '* Zuordnung zwischen Pin-Nummern und BCM-Nummern'
# Zuordnung zwischen Pin-Nummern und BCM-Nummern
gpio -g readall > pi-gpioNummern.txt
pinout > pi-gpioNummern2.txt

echo '* Systeminformationen'
# Systeminformationen
hostnamectl > pi-systemInfo.txt

echo '* Firmware'
# Firmware
vcgencmd version > pi-firmware.txt

echo '* CPU'
# CPU
cat /proc/cpuinfo > pi-cpu.txt

echo '* Pi Model'
# Pi Model
cat /proc/device-tree/model > pi-model.txt

echo '* Speicherplatz sdcard'
# Speicherplatz sdcard
df -h > pi-speicherplatz.txt

echo '* Taktfrequenzen der Prozessorkerne'
# Taktfrequenzen der Prozessorkerne
# sudo apt-get install cpufrequtils
cpufreq-info | grep -iE "analysiere|mögliche Taktfrequenzen|Statistik" > pi-takt-kerne.txt

echo '* Temperatur des Prozessors'
# Temperatur des Prozessors
vcgencmd measure_temp > pi-temperatur.txt

#echo '* '
# Informationen zur Prozessor- und Speicherauslastung
#top > pi-cpu-speicherauslastung.txt

echo '* Verteilung des Shared-Memory'
# Verteilung des Shared-Memory
vcgencmd get_mem arm > pi-shared-memory.txt
vcgencmd get_mem gpu >> pi-shared-memory.txt

echo '* RAM Speicher'
# RAM Speicher
free -h > pi-RAM-Speicher.txt

echo '* host - user - ip - speicherbelegung'
# host - user - ip - speicherbelegung
host=$(hostname)
echo '- Host: ' $host > pi-host-user-ipAdresse.txt
user=$(whoami)
echo '- User: ' $user >> pi-host-user-ipAdresse.txt
ip=$(ip addr | awk '/inet.[0-9]/&&!/127.0.0.1/ {print $2}')
echo '- IP: ' $ip >> pi-host-user-ipAdresse.txt
df -h >> pi-host-user-ipAdresse.txt 

echo '* Suche files'
#suche: files, die sich innerhalb 24 h geaendert haben
find ./ -type f -mtime -1 > ./files-24h-modifiziert.txt
mv ./files-24h-modifiziert.txt ./tmp; sort ./tmp > ./files-24h-modifiziert.txt; rm ./tmp

#suche: files, die sich innerhalb 7 Days geaendert haben
find ./ -type f -mtime -7 > ./files-7days-modifiziert.txt 
mv ./files-7days-modifiziert.txt ./tmp; sort ./tmp > ./files-7days-modifiziert.txt; rm ./tmp

#suche: *.sh, *.py 
find ./ -name '*.py' > ./files-python-scripte.txt 
mv ./files-python-scripte.txt ./tmp; sort ./tmp > ./files-python-scripte.txt; rm ./tmp
#
find ./ -name '*.sh' > ./files-bash-scripte.txt 
mv ./files-bash-scripte.txt ./tmp; sort ./tmp > ./files-bash-scripte.txt; rm ./tmp

# Aufruf ext. Script
./rechte.sh

echo '* mv alle *.txt > txt/'
# alle *.txt > txt/
ordner="txt"
if [ ! -d $ordner/ ]; then mkdir -p $ordner/; fi
mv *.txt $ordner/; 

echo ''





