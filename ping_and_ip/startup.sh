#!/bin/bash
#
# IP=$(curl https://ping.eu | grep "Your IP is")
#
# telegram-send "IP_EXT:"
# telegram-send $IP
# IP_ADR=echo ${IP:14:15}
# telegram-send $IP_ADR
#
# LIP=$(ifconfig |grep "inet ")
# telegram-send "IP_INT:"
# telegram-send $LIP
# # echo ${LIP}
#
# # OUT=$IP_ADR,$LIP
# # telegram-send $OUT
#
while [ 1 ]
do
    sleep 2m
    echo "running" > ~/Desktop/looooog.txt
    TMP_PING=$(curl https://ping.eu | grep "Your IP is")
    PING=${TMP_PING:14:15}
    IP=$(ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '{print $2}')

    telegram-send $PING
    telegram-send $IP
    sleep 1800
    # sleep 30m
done
# telegram-send "PING: $PING,  IP: $IP"
