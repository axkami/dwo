#!/bin/bash
MYIP=$(wget -qO- ifconfig.me/ip);
echo "Checking VPS"

clear
MYIP=$(wget -qO- ifconfig.me/ip);
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
echo -e "======================================" | lolcat
echo -e "Name : Change Port Openvpn"
echo -e "======================================" | lolcat
echo -e "     [1]  Change Port TCP $ovpn"
echo -e "     [2]  Change Port UDP $ovpn2"
echo -e "     [x]  Exit"
echo -e "======================================" | lolcat
echo -e ""
read -p "     Select From Options [1-2 or x] :  " prot
echo -e ""
case $prot in
1)
read -p "New Port OpenVPN: " vpn
if [ -z $vpn ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $vpn)
if [[ -z $cek ]]; then
rm -f /etc/openvpn/server/server-tcp-$ovpn.conf
rm -f /etc/openvpn/client-tcp-$ovpn.ovpn
rm -f /home/vps/public_html/client-tcp-$ovpn.ovpn
cat > /etc/openvpn/server/server-tcp-$vpn.conf<<END
port $vpn
proto tcp
dev tun
ca ca.crt
cert server.crt
key server.key
dh dh2048.pem
plugin /usr/lib/openvpn/openvpn-plugin-auth-pam.so login
verify-client-cert none
username-as-common-name
server 10.7.0.0 255.255.255.0
ifconfig-pool-persist ipp.txt
push "redirect-gateway def1 bypass-dhcp"
push "redirect-gateway ipv6 def1 bypass-dhcp"
sndbuf 512000
rcvbuf 512000
push "sndbuf 512000"
push "rcvbuf 512000"
mssfix 1400
tun-mtu 1500
push "dhcp-option DNS 1.1.1.3"
push "dhcp-option DNS 1.0.0.3"
keepalive 5 30
comp-lzo
push "route-gateway 185.128.139.1"
route-gateway 185.128.139.1
push "route-ipv6 2000::/3"
push "route-ipv6 fc00::8000:2/112"
push "route-ipv6 ::/0"
topology subnet
persist-key
persist-tun
status /var/log/openvpn/status.log
management 127.0.0.1 5555
verb 3
explicit-exit-notify
max-routes 200
END
cat > /etc/openvpn/client-tcp-$vpn.ovpn <<-END
client
dev tun
proto tcp
remote $MYIP $vpn
resolv-retry infinite
route-method exe
nobind
persist-key
persist-tun
auth-user-pass
comp-lzo
verb 3
END
echo '<ca>' >> /etc/openvpn/client-tcp-$vpn.ovpn
cat /etc/openvpn/server/ca.crt >> /etc/openvpn/client-tcp-$vpn.ovpn
echo '</ca>' >> /etc/openvpn/client-tcp-$vpn.ovpn
cp /etc/openvpn/client-tcp-$vpn.ovpn /home/vps/public_html/client-tcp-$vpn.ovpn
systemctl disable --now openvpn-server@server-tcp-$ovpn > /dev/null
systemctl enable --now openvpn-server@server-tcp-$vpn > /dev/null
sed -i "s/   - OpenVPN                 : TCP $ovpn, UDP $ovpn2, SSL 442/   - OpenVPN                 : TCP $vpn, UDP $ovpn2, SSL 442/g" /root/log-install.txt
sed -i "s/$ovpn/$vpn/g" /etc/stunnel/stunnel.conf
echo -e "\e[032;1mPort $vpn modified successfully\e[0m"
else
echo "Port $vpn is used"
fi
;;
2)
read -p "New Port OpenVPN: " vpn
if [ -z $vpn ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $vpn)
if [[ -z $cek ]]; then
rm -f /etc/openvpn/server/server-udp-$ovpn2.conf
rm -f /etc/openvpn/client-udp-$ovpn2.ovpn
rm -f /home/vps/public_html/client-tcp-$ovpn2.ovpn
cat > /etc/openvpn/server/server-udp-$vpn.conf<<END
port $vpn
proto udp
dev tun
ca ca.crt
cert server.crt
key server.key
dh dh2048.pem
plugin /usr/lib/openvpn/openvpn-plugin-auth-pam.so login
verify-client-cert none
username-as-common-name
server 10.7.0.0 255.255.255.0
ifconfig-pool-persist ipp.txt
push "redirect-gateway def1 bypass-dhcp"
push "redirect-gateway ipv6 def1 bypass-dhcp"
push "route-gateway 10.7.0.1"
push "route-ipv6 2000::/3"
push "route-ipv6 fc00::8000:2/112"
push "route-ipv6 ::/0"
sndbuf 512000
rcvbuf 512000
push "sndbuf 512000"
push "rcvbuf 512000"
mssfix 1400
tun-mtu 1500
push "dhcp-option DNS 1.1.1.3"
push "dhcp-option DNS 1.0.0.3"
keepalive 5 30
comp-lzo
push "max-routes 1000"
max-routes 1000
push "route 80.81.195.120"
push "route 80.81.195.124"
push "route 80.81.195.126"
push "route 80.81.195.127"
push "route 80.81.195.128"
push "route 80.81.195.130"
push "route 80.81.195.132"
push "route 3.64.0.0"
push "route 3.120.0.0"
push "route 18.184.0.0"
push "route 18.156.0.0"
push "route 18.192.0.0"
push "route 18.194.0.252"
push "route 52.29.63.252"
push "route 52.57.255.254"
push "route 52.58.63.252"
push "route 35.156.63.252"
push "route 54.93.32.2"
push "route 54.93.162.162"
topology subnet
persist-key
persist-tun
block-ipv6
push "block-ipv6"
status /var/log/openvpn/status.log
management 127.0.0.1 5555
verb 3
explicit-exit-notify
END
cat > /etc/openvpn/client-udp-$vpn.ovpn <<-END
client
setenv FRIENDLY_NAME "Dia Ping"
dev tun
proto udp
remote $MYIP $vpn
float
mssfix 1300
tun-mtu 1450
key-direction 1
auth-user-pass
comp-lzo
push-peer-info
END
echo '<ca>' >> /etc/openvpn/client-udp-$vpn.ovpn
cat /etc/openvpn/server/ca.crt >> /etc/openvpn/client-udp-$vpn.ovpn
echo '</ca>' >> /etc/openvpn/client-udp-$vpn.ovpn
cp /etc/openvpn/client-udp-$vpn.ovpn /home/vps/public_html/client-udp-$vpn.ovpn
systemctl disable --now openvpn-server@server-udp-$ovpn2 > /dev/null
systemctl enable --now openvpn-server@server-udp-$vpn > /dev/null
sed -i "s/   - OpenVPN                 : TCP $ovpn, UDP $ovpn2, SSL 442/   - OpenVPN                 : TCP $ovpn, UDP $vpn, SSL 442/g" /root/log-install.txt
echo -e "\e[032;1mPort $vpn modified successfully\e[0m"
else
echo "Port $vpn is used"
fi
;;
x)
exit
menu
;;
*)
echo "Please enter an correct number"
;;
esac

