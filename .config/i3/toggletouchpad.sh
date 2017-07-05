#!/bin/sh
NEWSTATE=0
STATUS=`synclient | grep TouchpadOff | cut -d= -f2 | tr -d ' '`
[ $STATUS -eq 0 ] && NEWSTATE=1
synclient TouchpadOff=$NEWSTATE
