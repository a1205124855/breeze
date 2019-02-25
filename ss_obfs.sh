#!/bin/bash
yum install git content -y
yum install gcc gettext autoconf libtool automake make pcre-devel asciidoc xmlto c-ares-devel libev-devel libsodium-devel mbedtls-devel zlib-devel openssl-devel -y

#下载编译ss
mkdir /root/ss
   
cd /root/ss
git clone https://github.com/shadowsocks/shadowsocks-libev.git
cd shadowsocks-libev
git submodule update --init --recursive
./autogen.sh && ./configure && make

#下载编译obfs
cd /root/ss
git clone https://github.com/shadowsocks/simple-obfs.git
cd simple-obfs
git submodule update --init --recursive
./autogen.sh && ./configure && make
