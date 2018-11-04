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
piTemp=$(vcgencmd measure_temp)
piMem_arm=$(vcgencmd get_mem arm)
piMem_gpu=$(vcgencmd get_mem gpu)
# host - user - ip
host=$(hostname)
user=$(whoami)
ip=$(ip addr | awk '/inet.[0-9]/&&!/127.0.0.1/ {print $2}')

echo ''
echo '***********************************************'
echo '*' $copyright $timestamp
echo '*' $piModel
echo '*' $piTemp
echo '* mem_'$piMem_arm
echo '* mem_'$piMem_gpu
echo '* Host: ' $host
echo '* User: ' $user
echo '* IP - LAN (1) und WLAN (2):' 
echo '*' $ip
echo '***********************************************'

echo ''
echo '  +++ "Infos" werden im Ordner "txt/*.txt" gespeichert!'
echo ''

# Zuordnung zwischen Pin-Nummern und BCM-Nummern
echo '* Zuordnung zwischen Pin-Nummern und BCM-Nummern'
echo '# Zuordnung zwischen Pin-Nummern und BCM-Nummern' > pi-gpioNummern.txt
echo '' >> pi-gpioNummern.txt
echo $copyright $timestamp >> pi-gpioNummern.txt
echo '' >> pi-gpioNummern.txt
gpio -g readall >> pi-gpioNummern.txt
pinout >> pi-gpioNummern.txt

# Systeminformationen
echo '* Systeminformationen'
echo '# Systeminformationen' > pi-systemInfo.txt
echo '' >> pi-systemInfo.txt
echo $copyright $timestamp >> pi-systemInfo.txt
echo '' >> pi-systemInfo.txt
hostnamectl >> pi-systemInfo.txt

# Firmware
echo '* Firmware'
echo '# Firmware' > pi-firmware.txt
echo '' >> pi-firmware.txt
echo $copyright $timestamp >> pi-firmware.txt
echo '' >> pi-firmware.txt
vcgencmd version >> pi-firmware.txt

# CPU
echo '* CPU'
echo '# CPU' > pi-cpu.txt
echo '' >> pi-cpu.txt
echo $copyright $timestamp >> pi-cpu.txt
echo '' >> pi-cpu.txt
cat /proc/cpuinfo >> pi-cpu.txt

# Pi Model
echo '* Pi Model'
echo '# Pi Model' > pi-model.txt
echo '' >> pi-model.txt
echo $copyright $timestamp >> pi-model.txt
echo '' >> pi-model.txt
cat /proc/device-tree/model >> pi-model.txt

# Speicherplatz sdcard
echo '* Speicherplatz sdcard'
echo '# Speicherplatz sdcard' > pi-speicherplatz.txt
echo '' >> pi-speicherplatz.txt
echo $copyright $timestamp >> pi-speicherplatz.txt
echo '' >> pi-speicherplatz.txt
df -h >> pi-speicherplatz.txt

# Taktfrequenzen der Prozessorkerne
# sudo apt-get install cpufrequtils
echo '* Taktfrequenzen der Prozessorkerne'
echo '# Taktfrequenzen der Prozessorkerne' > pi-takt-kerne.txt
echo '' >> pi-takt-kerne.txt
echo $copyright $timestamp >> pi-takt-kerne.txt
echo '' >> pi-takt-kerne.txt
cpufreq-info | grep -iE "analysiere|mögliche Taktfrequenzen|Statistik" >> pi-takt-kerne.txt

# Temperatur des Prozessors
echo '* Temperatur des Prozessors'
echo '# Temperatur des Prozessors' > pi-temperatur.txt
echo '' >> pi-temperatur.txt
echo $copyright $timestamp >> pi-temperatur.txt
echo '' >> pi-temperatur.txt
vcgencmd measure_temp >> pi-temperatur.txt

# Informationen zur Prozessor- und Speicherauslastung
#top > pi-cpu-speicherauslastung.txt

# Verteilung des Shared-Memory
echo '* Verteilung des Shared-Memory'
echo '# Verteilung des Shared-Memory' > pi-shared-memory.txt
echo '' >> pi-shared-memory.txt
echo $copyright $timestamp >> pi-shared-memory.txt
echo '' >> pi-shared-memory.txt
vcgencmd get_mem arm >> pi-shared-memory.txt
vcgencmd get_mem gpu >> pi-shared-memory.txt

# RAM Speicher
echo '* RAM Speicher'
echo '# RAM Speicher' > pi-RAM-Speicher.txt
echo '' >> pi-RAM-Speicher.txt
echo $copyright $timestamp >> pi-RAM-Speicher.txt
echo '' >> pi-RAM-Speicher.txt
free -h >> pi-RAM-Speicher.txt

# host - user - ip - speicherbelegung
echo '* host - user - ip - speicherbelegung'
echo '# host - user - ip - speicherbelegung' > pi-host-user-ipAdresse.txt
echo '' >> pi-host-user-ipAdresse.txt
echo $copyright $timestamp >> pi-host-user-ipAdresse.txt
echo '' >> pi-host-user-ipAdresse.txt
host=$(hostname)
echo 'Host: ' $host >> pi-host-user-ipAdresse.txt
user=$(whoami)
echo 'User: ' $user >> pi-host-user-ipAdresse.txt
ip=$(ip addr | awk '/inet.[0-9]/&&!/127.0.0.1/ {print $2}')
echo 'IP - LAN (1) und WLAN (2): ' $ip >> pi-host-user-ipAdresse.txt
df -h >> pi-host-user-ipAdresse.txt 

#suche: files, die sich innerhalb 24 h geaendert haben
echo '* Suche files'
echo '# suche: files, die sich innerhalb 24 h geaendert haben' > ./files-24h-modifiziert.txt
echo '' >> ./files-24h-modifiziert.txt
echo $copyright $timestamp >> ./files-24h-modifiziert.txt
echo '' >> ./files-24h-modifiziert.txt
find ./ -name '*.py' -type f -mtime -1 >> ./files-24h-modifiziert.txt
echo '****************' >> ./files-24h-modifiziert.txt 
find ./ -name '*.sh' -type f -mtime -1 >> ./files-24h-modifiziert.txt
mv ./files-24h-modifiziert.txt ./tmp; sort ./tmp > ./files-24h-modifiziert.txt; rm ./tmp

#suche: files, die sich innerhalb 7 Days geaendert haben
echo '# suche: files, die sich innerhalb 7 Days geaendert haben' > ./files-7days-modifiziert.txt 
echo '' >> ./files-7days-modifiziert.txt 
echo $copyright $timestamp >> ./files-7days-modifiziert.txt 
echo '' >> ./files-7days-modifiziert.txt 
find ./ -name '*.py' -type f -mtime -7 >> ./files-7days-modifiziert.txt 
echo '****************' >> ./files-7days-modifiziert.txt
find ./ -name '*.sh' -type f -mtime -7 >> ./files-7days-modifiziert.txt 
mv ./files-7days-modifiziert.txt ./tmp; sort ./tmp > ./files-7days-modifiziert.txt; rm ./tmp

#suche: *.sh, *.py 
echo '# suche: *.sh, *.py' > ./files-alle-scripte.txt 
echo '' >> ./files-alle-scripte.txt 
echo $copyright $timestamp >> ./files-alle-scripte.txt 
echo '' >> ./files-alle-scripte.txt 
find ./ -name '*.py' >> ./files-alle-scripte.txt 
echo '****************' >> ./files-alle-scripte.txt 
find ./ -name '*.sh' >> ./files-alle-scripte.txt 
mv ./files-alle-scripte.txt ./tmp; sort ./tmp > ./files-alle-scripte.txt; rm ./tmp

# Aufruf ext. Script
./rechte.sh

# mv alle *.txt > txt/
#sleep: 1 Sekunde warten
sleep 1
echo '* mv alle *.txt > txt/'
if [ ! -d $ordner/ ]; then mkdir -p $ordner/; fi
rm $ordner/*.txt
sudo mv *.txt $ordner/

echo ''





