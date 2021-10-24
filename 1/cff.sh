#!/bin/bash

cd /root
echo "Name : Add ID Cloudlare " | lolcat
echo ""
read -e -p " Input Domain :$domain" domain
read -e -p " Input Email Cloudflare :" email
read -e -p " Input Api Key :" key
echo -e "domain=$domain" >> /root/mail.conf
echo -e "email=$email" >> /root/mail.conf
echo -e "key=$key" >> /root/mail.conf
clear
echo "Done"
echo "Your ID Cloudflare"
echo -e "===============================" | lolcat
echo "DOMAIN         : $domain"
echo "Email          : $email"
echo "Api Key        : $key"
echo -e "===============================" | lolcat
