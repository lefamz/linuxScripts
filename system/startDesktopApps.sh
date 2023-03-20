#!/bin/bash

apps="firefox thunderbird"

function startTorGuard(){
	sudo torguard >> /dev/null 2>&1 &
	read -n1 -r -p "Press space to continue..." key
}

function startXscreensaver(){
	xscreensaver -nosplash &
}

function startInSilence(){
	echo Starting $1
	$1 >> /dev/null 2>&1 &
}

function startTidal(){
    tidal="firefox -new-window https://listen.tidal.com"
    startInSilence $tidal
}

#startXscreensaver
startTorGuard
for i in $apps; do
	startInSilence $i
done
