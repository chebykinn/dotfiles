#!/bin/sh
PLAYER_NAME="spotify"
PLAYER=''
IS_PLAYING="`playerctl -p "$PLAYER_NAME" status 2>/dev/null`"
if [ "$IS_PLAYING" = 'Playing' ]; then
	P_ARTIST=`playerctl -p "$PLAYER_NAME" metadata xesam:artist`
	P_TITLE=`playerctl -p "$PLAYER_NAME" metadata xesam:title`
	PLAYER="♪: $P_ARTIST - $P_TITLE"
fi
echo "$PLAYER" | tr -s '{}&' ' ' || exit 1
