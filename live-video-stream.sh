# Betriebssystem und die Raspberry-Pi-Firmware aktualisieren

sudo apt-get update
sudo apt-get upgrade
sudo rpi-update
sudo reboot

# Texteditor wechseln:
sudo update-alternatives --config editor

# TightVNC Server und Viewer installieren
sudo apt-get install tightvncserver

# TightVNC Server mit einer Full-HD-Auflösung zu starten
tightvncserver -geometry 1920x1080 -depth 16
  #Password:
  #Would you like to enter a view-only password (y/n)? n
  #New 'X' desktop is raspi:1

# TightVNC Viewer installieren Win10

<http://www.tightvnc.com/download.php>

# Raspian: TightVNC Server starten
# Win10: Remote Host die Zugriffsinformation
TightVNC Viewer / Remote Host: raspi:1 #connect

# PuTTY installieren

<https://www.putty.org/>

# ssh <Benutzername>@<IP-Adresse> -p <Port>
ssh pi@192.168.178.60 -p 22

# Samba Server installieren
sudo apt-get install samba samba-common-bin

# Samba-Server-Konfiguration
sudo vi /etc/samba/smb.conf
[robot]
  path = /home/pi
  writeable = yes
  public = yes
  guest ok = yes
  guest only = yes
  guest account = nobody
  browsable = yes

sudo /etc/init.d/samba restart

# Python installieren
sudo apt-get install python-rpi.gpio
# Fernsteuerung des Roboter-Autos über die Tastatur
sudo pip install readchar

# Subversion-Client installieren
sudo apt-get install subversion
# Video-Streaming-Server installieren
# libjpeg8-dev-Bibliothek installieren
sudo apt-get install libjpeg8-dev
# imagemagick installieren
sudo apt-get install imagemagick
# mjpg-streamer von Subversion herunterladen
sudo mkdir /opt/mjpg-streamer
cd /opt/mjpg-streamer/
sudo svn co https://svn.code.sf.net/p/mjpg-streamer/code/mjpg-streamer/ .
# symbolischen Link für den mjpg-streamer setzen
sudo ln -s /usr/include/linux/videodev2.h /usr/include/linux/videodev.h
# mjpg-streamer patchen
# Patch herunterladen: mjpg-streamer-patch
http://custom-build-robots.com/roboter-auto-download
# Patch kopieren
cd mjpg-streamer-patch/
sudo cp  ./* /opt/mjpg-streamer/plugins/input_uvc/ 
# mjpg-streamer installieren
cd /opt/mjpg-streamer/
sudo make install

# kamera

# bilder
raspistill -o testbild.jpg
# video
raspivid -o testvideo.h264 -t 20000 # 20s

# Live-Video-Stream

# Kernelmodul laden
# reduziert die Datenmenge über das Netzwerk
sudo vi /etc/modules
  bcm2835-v4l2

# mjpg-streamer konfigurieren
sudo vi /opt/mjpg-streamer/start.sh 
# Suche Zeile:
./mjpg_streamer -i "./input_uvc.so" -o "./output_http.so -w ./www"
# Ergänzung 
-d /dev/video0 -r 800x640 -f 25
# ziel
./mjpg_streamer -i "./input_uvc.so -d /dev/video0 -r 800x640 -f 25" -o
"./output_http.so -w ./www"

# mjpg-streamer-Server starten
cd /opt/mjpg-streamer/ 
sudo modprobe bcm2835-v4l2 #(falls dieses Modul noch nicht geladen ist)
sudo ./start.sh
# Streaming aktiv, im Webbrowser Live-Video aufrufen:
#<IP-Adresse des Roboter-Autos>:8080
192.168.178.60:8080

