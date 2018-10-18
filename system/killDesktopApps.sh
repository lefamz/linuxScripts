#!/bin/bash

deluge="/usr/bin/python2 /usr/bin/deluge-gtk"
apps="firefox vivaldi-bin opera chromium spotify thunderbird synology-note-station qbittorrent $deluge steam"

function killthat(){
	if [[ ! -z `pidof $1` ]]; then
		echo Killing: $1
		killApp.sh $1
	fi
}

for i in $apps; do
	killthat $i
done
