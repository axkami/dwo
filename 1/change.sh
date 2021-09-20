#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
clear
echo -e "Name : Change Port All Service"
echo -e "======================================" | lolcat
echo -e ""
echo -e "     [1]  Change Port Stunnel4" | lolcat
echo -e "     [2]  Change Port OpenVPN" | lolcat
echo -e "     [3]  Change Port Wireguard" | lolcat
echo -e "     [7]  Change Port Squid" | lolcat
echo -e "     [x]  Exit"| lolcat
echo -e "======================================" | lolcat
echo -e ""
read -p "     Select From Options [1-8 or x] :  " port
echo -e ""
case $port in
1)
port-ssl
;;
2)
port-ovpn
;;
3)
port-wg
;;
7)
port-squid
;;
x)
clear
menu
;;
*)
echo "Please enter an correct number"
;;
esac
