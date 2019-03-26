#!/bin/bash
# nat routing of device of host computer
sudo iptables --table nat --append POSTROUTING --out-interface enp0s31f6 -j MASQUERADE
# connection to beaglebone device
sudo iptables --append FORWARD --in-interface enp0s20f0u10u2 -j ACCEPT
sudo echo 1 > /proc/sys/net/ipv4/ip_forward

# setting of device
# 192.168.7.1 / 255.255.255.0 / Gateway 192.168.1.99

