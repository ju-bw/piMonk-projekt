#!/bin/bash -e
# chmod a+x *.sh
# ./script.sh
# % ju -- https://bw1.eu -- 3-11-18
# update:   
#==================================

# Konfigurationstool - Option Enable Camera
#sudo raspi-config

# Standbild
raspistill -o image.jpg
# Videos 10s
raspivid -o video.h264 -t 10000

# Webcam-Server einrichten
#sudo apt-get install motion
 