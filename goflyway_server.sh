#!/bin/bash
export PATH=$PATH:/root/goflyway
kill $(ps -ef | grep goflyway | grep -v grep | awk '{print $2}')
nohup goflyway -k="password" -l=":8080" -proxy-pass="http://mirror.clarkson.edu/" > /dev/null 2>&1 &

echo '
#win客户端:
#goflyway.exe -up="cf://域名:80" -k="密码" -l=":1081" -web-port="8101" -lv=dbg -g
#goflyway.exe -up="cfs://郁闷:443" -k="密码" -l=":1081" -web-port="8101" -lv=dbg -g

#linux客户端:
#goflyway -up="cf://域名:80" -k="密码" -l=":1081" -web-port="8101" -lv=dbg -g
#goflyway -up="cfs://郁闷:443" -k="密码" -l=":1081" -web-port="8101" -lv=dbg -g
'
