#!/bin/bash
ifconfig eth0 down
ifconfig eth0 hw ether 54:04:a6:76:10:ec
ifconfig eth0 up
