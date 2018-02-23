#!/bin/bash

appName=$1

processes=`ps axu | awk '/'$appName'/ {print $2}'`

echo $processes

for i in $processes; do
	echo "Killing PID: " $i
	kill $i
done
