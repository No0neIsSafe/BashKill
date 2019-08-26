#!/usr/bin/bash
if [ -z "$1" ]
  then
    echo "Usage: ./snmpsweep.sh <network>"
    echo "Example: ./snmpsweep.sh 192.168.1.0/24"
    exit 1
fi


nmap -sU -p 161 $1 -oG snmp.txt > /dev/null 2>&1
cat snmp.txt|grep open|cut -d " " -f2 >snmp-ips.txt
onesixtyone -i snmp-ips.txt -c community.txt -o snmp_out.txt > /dev/null 2>&1
cat snmp_out.txt
