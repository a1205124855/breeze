#/bin/bash
cp /etc/v2ray/config.json /etc/v2ray/v2ray.$(date "+%Y%m%d%H%M%S").bak
cat > /etc/v2ray/config.json <<-EOF
{
  "log" : {
    "access": "/var/log/v2ray/access.log",
    "error": "/var/log/v2ray/error.log",
    "loglevel": "warning"
  },

  "routing": {
    "strategy": "rules",
    "settings": {
        "domainStrategy": "AsIs",
        "rules": [
          {
            "type": "field",
            "outboundTag": "block",
            "protocol": [
              "bittorrent"
            ],
            "ip": [
              "0.0.0.0/8",
              "10.0.0.0/8",
              "100.64.0.0/10",
              "127.0.0.0/8",
              "169.254.0.0/16",
              "172.16.0.0/12",
              "192.0.0.0/24",
              "192.0.2.0/24",
              "192.168.0.0/16",
              "198.18.0.0/15",
              "198.51.100.0/24",
              "203.0.113.0/24",
              "::1/128",
              "fc00::/7",
              "fe80::/10"
              ],
              "outboundTag": "blocked"
          },
          {
            "type": "field",
            "outboundTag": "block",
            "protocol": ["http","tls","bittorrent"],
            "domain": [
              "api.map.baidu.com",
              "ps.map.baidu.com",
              "sv.map.baidu.com",
              "offnavi.map.baidu.com",
              "newvector.map.baidu.com",
              "ulog.imap.baidu.com",
              "newloc.map.n.shifen.com",
              "api.map.baidu.com",

              "apis.google.com",

              "regexp:\\.*map.baidu.*\\.*$",
              "regexp:\\.*shifen.*\\.*$",
              "domain:map.baidu.com",
              "domain:shifen.com",

              "Subject",
              "HELO",
              "SMTP",

              "domain:xunlei.com",
              "domain:xunlei.cn",
              "domain:sandai.com",
              "domain:sandai.cn",
              "domain:Thunder.com",
              "domain:Thunder.cn",
              "domain:XLLiveUD.com",
              "domain:XLLiveUD.cn",
              "regexp:\\.*xunlei.*\\.*$",
              "regexp:\\.*sandai.*\\.*$",
              "regexp:\\.*Thunder.*\\.*$",
              "regexp:\\.*XLLiveUD.*\\.*$",

              "domain:dafahao.com",
              "domain:dafahao.cn",
              "domain:minghui.com",
              "domain:minghui.cn",
              "domain:dongtaiwang.com",
              "domain:dongtaiwang.cn",
              "domain:epochtimes.com",
              "domain:epochtimes.cn",
              "domain:ntdtv.com",
              "domain:ntdtv.cn",
              "domain:falundafa.com",
              "domain:falundafa.cn",
              "domain:wujieliulan.com",
              "domain:wujieliulan.cn",
              "regexp:\\.*dafahao.*\\.*$",
              "regexp:\\.*minghui.*\\.*$",
              "regexp:\\.*dongtaiwang.*\\.*$",
              "regexp:\\.*epochtimes.*\\.*$",
              "regexp:\\.*ntdtv.*\\.*$",
              "regexp:\\.*falundafa.*\\.*$",
              "regexp:\\.*wujieliulan.*\\.*$",

              "domain:dafahao.ort",
              "domain:minghui.ort",
              "domain:dongtaiwang.ort",
              "domain:epochtimes.ort",
              "domain:ntdtv.ort",
              "domain:falundafa.ort",
              "domain:wujieliulan.ort",

              "domain:dafahao.com",
              "domain:minghui.com",
              "domain:dongtaiwang.com",
              "domain:epochtimes.com",
              "domain:ntdtv.com",
              "domain:falundafa.com",
              "domain:wujieliulan.com",

              "domain:dafahao.net",
              "domain:minghui.net",
              "domain:dongtaiwang.net",
              "domain:epochtimes.net",
              "domain:ntdtv.net",
              "domain:falundafa.net",
              "domain:wujieliulan.net",

              "domain:360.com",
              "domain:360.cn",
              "regexp:\\.*360.\\.*$",
              "regexp:\\.360.*\\.*$",

              "domain:360totalsecurity.com",
              "domain:360totalsecurity.cn",
              "domain:so.com",
              "domain:so.cn"

            ],
            "outboundTag": "blocked"
          }
        ]
    }
  },

  "inbounds": [
   {
    "port": 8081,
    "listen": "127.0.0.1",
    "protocol": "vmess",
    "settings": {
      "clients": [
        {
          "id": "4a5e1f77-1a94-4fcc-bfec-927edf8db918",
          "level": 0,
          "alterId": 64,
          "security": "chacha20-poly1305"   // 推荐手机
        }
      ]
    },

    "sniffing": {
      "enabled": true,
      "destOverride": ["http","tls"]
    },
    "streamSettings":{
        "network":"ws",
        "security": "auto",
        "wsSettings":{
             "connectionReuse": true,
             "path": "/chav2/"
         }
      }
    },
    {
    "sniffing": {
      "enabled": true,
      "destOverride": [
        "http",
        "tls"
      ]
    },
    "port": 8082,
    "protocol": "vmess",
    "listen": "127.0.0.1",
    "settings": {
      "clients": [
        {
          "id": "4a5e1f77-1a94-4fcc-bfec-927edf8db918",
          "level": 0,
          "alterId": 64,
          "security": "aes-128-gcm"   // 推荐电脑
        }
      ]
    },
    "streamSettings":{
        "network":"ws",
        "security": "auto",
        "wsSettings":{
             "connectionReuse": true,
             "path": "/128v2/"
         }
      }
    }
  ],

  "outbounds": [
  {
    "protocol": "freedom",
    "settings": {}
  },
  {
    "protocol": "blackhole",
    "settings": {},
    "tag": "blocked"
  }
  ]


}
EOF

UUID=$(cat /etc/v2ray/config.json  | grep '"id":' | head -n 1 | awk '{print $2}' | awk -F '"' '{print $2}')
sed -i "s/4a5e1f77-1a94-4fcc-bfec-927edf8db918/${UUID}/g" "/etc/v2ray/config.json"
systemctl restart v2ray
echo $UUID
ss -tunlp | grep v2ray
