#!/bin/bash

#killall chromium
killall opera
killall spotify
killall thunderbird
killall synology-note-station

if [[ ! -z `pidof qbittorrent` ]]; then
	killApp.sh qbittorrent
fi
