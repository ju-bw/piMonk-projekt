#!/bin/bash -e
# chmod a+x *.sh
# ./script.sh
# % ju -- https://bw1.eu -- 3-11-18
# update:   
#==================================

# Konfigurationstool - Option Enable Camera
#sudo raspi-config

# Standbild
raspistill -o image-pi.jpg
# Videos 10s
raspivid -o video-pi.h264 -t 10000
#sudo apt-get install libav-tools
avconv -i video-pi.h264 video-pi.mp4

# USB Webcam-Server einrichten
#sudo apt-get install motion
 