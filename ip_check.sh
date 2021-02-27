#!/bin/bash
. /etc/rc.d/init.d/functions
while read ip;do
  ping -c1 $ip > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    action ${ip}  /bin/true
  else
    action ${ip} /bin/false
  fi
done < ./ip.lst
