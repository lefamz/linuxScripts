#!/bin/bash

apps="opera spotify thunderbird synology-note-station"

function startInSilence(){
	echo Starting $1
	$1 >> /dev/null 2>&1 &
}

for i in $apps; do
	startInSilence $i
done
