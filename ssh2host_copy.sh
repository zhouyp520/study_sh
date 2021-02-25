#!/bin/bash
# FileName:             ssh2host.sh
# Revision:             1.0
# Date:                 2020-06-29
# Author:               baige
# Description:          the script for auto-ssh-login 
while read host;do
        ip=`echo $host | cut -d " " -f1`
        username='root'
        password='ADyh3yxyz!'
expect <<EOF
        spawn ssh-copy-id -i id_rsa.pub $username@$ip
        expect {
                "yes/no" {send "yes\n"}
                "password" {send "$password\n"}
        }
        expect eof
EOF
done < ./host
