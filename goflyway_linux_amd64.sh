#!/bin/bash
#服务端:
yum install wget
mkdir -p /root/goflyway
cd /root/goflyway
wget https://github.com/coyove/goflyway/releases/download/2.0.0rc1/goflyway_linux_amd64.tar.gz
tar -zxvf goflyway_linux_amd64.tar.gz
