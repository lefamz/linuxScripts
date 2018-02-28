#!/bin/bash

# Scripts that kills application, which is passed as argument.

appName=$1

p=`pidof $appName`

# while is that son of a b.. running, kill it's process!
while [[ ! -z $p ]]; do
	kill $p
	p=`pidof $appName`
done

