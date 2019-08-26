#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ]
  then
    echo "Usage: ./pingloop.sh <start-ip> <end-ip>"
    exit 1
fi



dotted_quad_to_integer()
{
  IFS="." read a b c d <<< `echo $1`
  expr $(( (a<<24) + (b<<16) + (c<<8) + d))
}

start=$(dotted_quad_to_integer $1)
end=$(dotted_quad_to_integer $2)

for ip in $(seq $start $end); do
ping -c1 -w1 ${ip} | grep "bytes from" | cut -d " " -f4| cut -d ":" -f1 >>ips.txt
done
