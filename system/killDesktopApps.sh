#!/bin/bash

apps="opera spotify thunderbird synology-note-station qbittorrent"

function killthat(){
	if [[ ! -z `pidof $1` ]]; then
		echo Killing: $1
		killApp.sh $1
	fi
}

for i in $apps; do
	killthat $i
done
