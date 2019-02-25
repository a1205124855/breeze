#!/bin/bash
export PATH=$PATH:/root/ss/shadowsocks-libev/src
kill $(ps -ef | grep ss-local | grep -v grep | awk '{print $2}')
nohup ss-local -c /root/ss/config.json > /dev/null 2>&1 &
