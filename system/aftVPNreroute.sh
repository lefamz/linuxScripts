#!/bin/bash
echo "Changing default route to 192.168.1.99 (AFT gateway)"
sudo ip route delete default
sudo ip route add default via 192.168.1.99
echo "Rerouting complete"
