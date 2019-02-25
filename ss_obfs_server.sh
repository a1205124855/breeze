#!/bin/bash
export PATH=$PATH:/root/ss/shadowsocks-libev/src
kill $(ps -ef | grep ss-server | grep -v grep | awk '{print $2}')
nohup ss-server -c /root/ss/config.json > /dev/null 2>&1 &
