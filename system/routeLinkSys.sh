#!/bin/bash
sudo ip route delete default via 192.168.1.100 dev wlp0s20f0u3
sudo ip route add 192.168.1.127 dev wlp0s20f0u3
sudo ip route add 192.168.1.100 dev wlp0s20f0u3
