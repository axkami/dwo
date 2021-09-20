#!/bin/bash

systemctl daemon-reload
systemctl restart sslh
systemctl restart ws-dropbear
systemctl restart ws-stunnel
systemctl restart ws-openssh
systemctl restart ws-openvpn
systemctl restart ssrmu
systemctl restart accel-ppp
systemctl restart wg-quick@wg0
systemctl restart ssh
systemctl restart stunnel4
systemctl restart dropbear
systemctl restart openvpn
systemctl restart nginx
systemctl restart squid
systemctl restart cron
systemctl restart fail2ban
systemctl restart vnstat
