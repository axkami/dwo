#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.me/ip);
clear
echo "Starting Update ..." | lolcat
# update
cd /usr/bin

wget -O menu "https://raw.githubusercontent.com/axkami/dwo/main/3/menu.sh"
wget -O ssh "https://raw.githubusercontent.com/axkami/dwo/main/3/ssh.sh"
wget -O wgr "https://raw.githubusercontent.com/axkami/dwo/main/3/wgr.sh"
wget -O bbr "https://raw.githubusercontent.com/axkami/dwo/main/3/bbr.sh"
wget -O bannerku "https://raw.githubusercontent.com/axkami/dwo/main/3/bannerku"
wget -O add-host "https://raw.githubusercontent.com/axkami/dwo/main/1/add-host.sh"
wget -O about "https://raw.githubusercontent.com/axkami/dwo/main/1/about.sh"
wget -O usernew "https://raw.githubusercontent.com/axkami/dwo/main/1/usernew.sh"
wget -O trial "https://raw.githubusercontent.com/axkami/dwo/main/1/trial.sh"
wget -O hapus "https://raw.githubusercontent.com/axkami/dwo/main/1/hapus.sh"
wget -O member "https://raw.githubusercontent.com/axkami/dwo/main/1/member.sh"
wget -O delete "https://raw.githubusercontent.com/axkami/dwo/main/1/delete.sh"
wget -O cek "https://raw.githubusercontent.com/axkami/dwo/main/1/cek.sh"
wget -O restart "https://raw.githubusercontent.com/axkami/dwo/main/1/restart.sh"
wget -O speedtest "https://raw.githubusercontent.com/axkami/dwo/main/1/speedtest_cli.py"
wget -O info "https://raw.githubusercontent.com/axkami/dwo/main/1/info.sh"
wget -O ram "https://raw.githubusercontent.com/axkami/dwo/main/1/ram.sh"
wget -O renew "https://raw.githubusercontent.com/axkami/dwo/main/1/renew.sh"
wget -O autokill "https://raw.githubusercontent.com/axkami/dwo/main/1/autokill.sh"
wget -O ceklim "https://raw.githubusercontent.com/axkami/dwo/main/1/ceklim.sh"
wget -O tendang "https://raw.githubusercontent.com/axkami/dwo/main/1/tendang.sh"
wget -O clear-log "https://raw.githubusercontent.com/axkami/dwo/main/1/clear-log.sh"
wget -O change-port "https://raw.githubusercontent.com/axkami/dwo/main/1/change.sh"
wget -O port-ovpn "https://raw.githubusercontent.com/axkami/dwo/main/1/port-ovpn.sh"
wget -O port-ssl "https://raw.githubusercontent.com/axkami/dwo/main/1/port-ssl.sh"
wget -O port-wg "https://raw.githubusercontent.com/axkami/dwo/main/2/ipvps"
wget -O port-squid "https://raw.githubusercontent.com/axkami/dwo/main/1/port-squid.sh"
wget -O port-ws "https://raw.githubusercontent.com/axkami/dwo/main/1/port-ws.sh"
wget -O wbmn "https://raw.githubusercontent.com/axkami/dwo/main/1/webmin.sh"
wget -O xp "https://raw.githubusercontent.com/axkami/dwo/main/1/xp.sh"
wget -O swap "https://raw.githubusercontent.com/axkami/dwo/main/1/swapkvm.sh"
wget -O user-limit "https://raw.githubusercontent.com/axkami/dwo/main/1/user-limit.sh"
wget -O auto-reboot "https://raw.githubusercontent.com/axkami/dwo/main/1/auto-reboot.sh"
wget -O running "https://raw.githubusercontent.com/axkami/dwo/main/3/running.sh"
wget -O update "https://raw.githubusercontent.com/axkami/dwo/main/2/update.sh"
wget -O cfd "https://raw.githubusercontent.com/axkami/dwo/main/1/cfd.sh"
wget -O cff "https://raw.githubusercontent.com/axkami/dwo/main/1/cff.sh"
wget -O cfh "https://raw.githubusercontent.com/axkami/dwo/main/1/cfh.sh"
wget -O add-ws "https://raw.githubusercontent.com/axkami/dwo/main/1/add-ws.sh"
wget -O del-ws "https://raw.githubusercontent.com/axkami/dwo/main/1/del-ws.sh"
wget -O cek-ws "https://raw.githubusercontent.com/axkami/dwo/main/1/cek-ws.sh"
wget -O renew-ws "https://raw.githubusercontent.com/axkami/dwo/main/1/renew-ws.sh"
wget -O add-wg "https://raw.githubusercontent.com/axkami/dwo/main/1/add-wg.sh"
wget -O del-wg "https://raw.githubusercontent.com/axkami/dwo/main/1/del-wg.sh"
wget -O cek-wg "https://raw.githubusercontent.com/axkami/dwo/main/1/cek-wg.sh"
wget -O renew-wg "https://raw.githubusercontent.com/axkami/dwo/main/1/renew-wg.sh"
wget -O bw "https://raw.githubusercontent.com/axkami/dwo/main/2/bw.sh"
wget -O panel-domain "https://raw.githubusercontent.com/axkami/dwo/main/2/panel-domain.sh"
wget -O resett "https://raw.githubusercontent.com/axkami/dwo/main/2/resett.sh"

chmod +x menu
chmod +x l2tp
chmod +x ssh
chmod +x ssssr
chmod +x sstpp
chmod +x wgr
chmod +x bbr
chmod +x bannerku
chmod +x add-host
chmod +x usernew
chmod +x trial
chmod +x hapus
chmod +x member
chmod +x delete
chmod +x cek
chmod +x restart
chmod +x speedtest
chmod +x info
chmod +x about
chmod +x autokill
chmod +x tendang
chmod +x ceklim
chmod +x ram
chmod +x renew
chmod +x clear-log
chmod +x change-port
chmod +x port-ovpn
chmod +x port-ssl
chmod +x port-wg
chmod +x port-sstp
chmod +x port-tr
chmod +x port-squid
chmod +x port-ws
chmod +x wbmn
chmod +x xp
chmod +x swap
chmod +x auto-reboot
chmod +x running
chmod +x update
chmod +x cfd
chmod +x cff
chmod +x cfh
chmod +x add-trgo
chmod +x xp-trgo
chmod +x cek-trgo
chmod +x renew-trgo
chmod +x port-trgo
chmod +x del-trgo
chmod +x add-ws
chmod +x add-vless
chmod +x add-tr
chmod +x del-ws
chmod +x del-vless
chmod +x del-tr
chmod +x cek-ws
chmod +x cek-vless
chmod +x cek-tr
chmod +x renew-ws
chmod +x renew-vless
chmod +x renew-tr
chmod +x add-l2tp
chmod +x del-l2tp
chmod +x add-pptp
chmod +x del-pptp
chmod +x cek-pptp
chmod +x renew-pptp
chmod +x renew-l2tp
chmod +x add-ss
chmod +x del-ss
chmod +x cek-ss
chmod +x renew-ss
chmod +x add-ssr
chmod +x del-ssr
chmod +x renew-ssr
chmod +x add-wg
chmod +x del-wg
chmod +x cek-wg
chmod +x renew-wg
chmod +x bw
chmod +x panel-domain
chmod +x resett
sed -i -e 's/\r$//' add-l2tp

echo " Successfully Update :"
echo " - Fix minor Bugs"
echo " Reboot 5 Sec"
sleep 5
rm -f update.sh
reboot
