#!/bin/bash -e
# chmod a+x *.sh
# ./script.sh
# % ju -- https://bw1.eu -- 3-11-18
# update:   
#==================================

hostname -I

ifconfig

host=$(hostname)
echo '- Host: ' $host 
user=$(whoami)
echo '- User: ' $user 
ip=$(ip addr | awk '/inet.[0-9]/&&!/127.0.0.1/ {print $2}')
echo '- IP: ' $ip 