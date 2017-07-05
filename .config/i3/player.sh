#!/bin/sh
PLAYER=''
IS_PLAYING="`playerctl status 2>/dev/null`"
if [ "$IS_PLAYING" = 'Playing' ]; then
	P_ARTIST=`playerctl metadata xesam:artist`
	P_TITLE=`playerctl metadata xesam:title`
	PLAYER="♪: $P_ARTIST - $P_TITLE"
fi
echo "$PLAYER" | tr -s '{}&' ' ' || exit 1
