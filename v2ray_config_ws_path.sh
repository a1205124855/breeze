#/bin/bash
cp /etc/v2ray/config.json /etc/v2ray/v2ray.$(date "+%Y%m%d%H%M%S").bak
curl -L -s https://raw.githubusercontent.com/booomu/booom_update/master/v2ray_config_ws_path.json > /etc/v2ray/config.json
UUID=$(cat /etc/v2ray/config.json  | grep '"id":' | head -n 1 | awk '{print $2}' | awk -F '"' '{print $2}')
sed -i "s/4a5e1f77-1a94-4fcc-bfec-927edf8db918/${UUID}/g" "/etc/v2ray/config.json"
systemctl restart v2ray
echo $UUID
ss -tunlp | grep v2ray
