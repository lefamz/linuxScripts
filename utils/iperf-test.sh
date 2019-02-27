#!/bin/bash
time=`date +%F_%k_%M_%S`
echo "timestamp,source_addr,source_port,server_addr,server_port,iperf_process_number,time_inerval,transferred_bytes,bits_per_second,jitter_ms,datagrams_lost_number,datagrams_sent_total_number,loss_percentage,datagrams_out_of_order" >> iperf_${time}.log
iperf -u -b 25M -c 192.168.0.51 -t 60 -y C -i 1 | tee -a iperf_${time}.log


