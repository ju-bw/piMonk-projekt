#!/bin/bash -e
# chmod a+x *.sh
# ./script.sh
# % ju -- https://bw1.eu -- 3-11-18
# update:   
#==================================

# Zuordnung zwischen Pin-Nummern und BCM-Nummern
gpio -g readall > pi-gpioNummern.txt
pinout > pi-gpioNummern2.txt
# Systeminformationen
hostnamectl > pi-systemInfo.txt
# Firmware
vcgencmd version > pi-firmware.txt
# CPU
cat /proc/cpuinfo > pi-cpu.txt
# Pi Model
cat /proc/device-tree/model > pi-model.txt
# Speicherplatz sdcard
df -h > pi-speicherplatz.txt
# Taktfrequenzen der Prozessorkerne
# sudo apt-get install cpufrequtils
cpufreq-info | grep -iE "analysiere|mögliche Taktfrequenzen|Statistik" > pi-takt-kerne.txt
# Temperatur des Prozessors
vcgencmd measure_temp > pi-temperatur.txt
# Informationen zur Prozessor- und Speicherauslastung
top > pi-cpu-speicherauslastung.txt
# Verteilung des Shared-Memory
vcgencmd get_mem arm && vcgencmd get_mem gpu > pi-shared-memory.txt
# RAM Speicher
free -h > pi-RAM-Speicher.txt

