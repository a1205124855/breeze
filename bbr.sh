#!/bin/bash
   echo 'net.ipv4.ip_forward=1' | tee -a /etc/sysctl.conf
   echo 'net.core.default_qdisc=fq' |  tee -a /etc/sysctl.conf
   echo 'net.ipv4.tcp_congestion_control=bbr' |  tee -a /etc/sysctl.conf
   sysctl -p
