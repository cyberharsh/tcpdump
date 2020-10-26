#!/bin/bash


PARAMS="--permit-write --reconnect --reconnect-time 1"

if [[ -n $BASIC_AUTH_USER || -n $BASIC_AUTH_PASS ]]; then
        PARAMS="$PARAMS --credential $BASIC_AUTH_USER:$BASIC_AUTH_PASS"
fi

gotty $PARAMS /bin/bash

while true
do
 nping -c 1 --tcp 0.0.0.0 -p 80,433,20,21,22,23,25,53,179,137,139,989,107,110
 delay 2
 nping -c 1 --udp 0.0.0.0 -p 53,69,67,66,123
done
