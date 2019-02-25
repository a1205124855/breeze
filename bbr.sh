#!/bin/bash
   echo 'net.core.default_qdisc=fq' |  tee -a /etc/sysctl.conf
   echo 'net.ipv4.tcp_congestion_control=bbr' |  tee -a /etc/sysctl.conf
   sysctl -p
