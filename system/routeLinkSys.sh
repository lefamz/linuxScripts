#!/bin/bash
device=wlp0s20f0u5
#sudo ip route delete default via 192.168.1.100 dev $device
#sudo ip route add 192.168.1.127 dev $device
#sudo ip route add 192.168.1.100 dev $device
sudo ip route add 192.168.2.110 dev $device
sudo ip route add 192.168.2.100 dev $device
sudo ip route add 192.168.2.111 dev $device
sudo ip route add 192.168.2.112 dev $device
