#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

echo -e ""
echo -e "${red}======================================${off}"
echo -e        "           BANDWITH MONITOR " | lolcat
echo -e "${red}======================================${off}"
echo -e "${white}"
echo -e "     1 =>   See the total bandwidth remaining"
echo -e "     2 =>   Tabel Penggunaan Setiap 5 Minute"
echo -e "     3 =>   Tabel Penggunaan Setiap O'clock"
echo -e "     4 =>   Tabel Penggunaan Setiap Day"
echo -e "     5 =>   Tabel Penggunaan Setiap Month"
echo -e "     6 =>   Tabel Penggunaan Setiap Tahun"
echo -e "     7 =>   Table of the highest use"
echo -e "     8 =>   Usage statistics every hour"
echo -e "     9 =>   See current active use"
echo -e "    10 =>   See Active Use Traffic Today [5s]"
echo -e "     x =>   Exit"
echo -e "${off}"
echo -e "${red}======================================${off}"
echo -e "${white}"
read -p "     [#]  Masukkan Nomor :  " noo
echo -e "${off}"

case $noo in
1)
echo -e "${red}======================================${off}"
echo -e "    TOTAL BANDWITH SERVER TERSISA" | lolcat
echo -e "${red}======================================${off}"
echo -e ""

vnstat

echo -e ""
echo -e "${red}======================================${off}"
echo -e "$baris2" | lolcat
;;

2)
echo -e "${red}======================================${off}"
echo -e "  PENGGUNAAN BANDWITH SETIAP 5 MENIT" | lolcat
echo -e "${red}======================================${off}"
echo -e ""

vnstat -5

echo -e ""
echo -e "${red}======================================${off}"
echo -e "$baris2" | lolcat
;;

3)
echo -e "${red}======================================${off}"
echo -e "    PENGGUNAAN BANDWITH SETIAP JAM" | lolcat
echo -e "${red}======================================${off}"
echo -e ""

vnstat -h

echo -e ""
echo -e "${red}======================================${off}"
echo -e "$baris2" | lolcat
;;

4)
echo -e "${red}======================================${off}"
echo -e "   PENGGUNAAN BANDWITH SETIAP HARI" | lolcat
echo -e "${red}======================================${off}"
echo -e ""

vnstat -d

echo -e ""
echo -e "${red}======================================${off}"
echo -e "$baris2" | lolcat
;;

5)
echo -e "${red}======================================${off}"
echo -e "   PENGGUNAAN BANDWITH SETIAP BULAN" | lolcat
echo -e "${red}======================================${off}"
echo -e ""

vnstat -m

echo -e ""
echo -e "${red}======================================${off}"
echo -e "$baris2" | lolcat
;;

6)
echo -e "${red}======================================${off}"
echo -e "   PENGGUNAAN BANDWITH SETIAP TAHUN" | lolcat
echo -e "${red}======================================${off}"
echo -e ""

vnstat -y

echo -e ""
echo -e "${red}======================================${off}"
echo -e "$baris2" | lolcat
;;

7)
echo -e "${red}======================================${off}"
echo -e "    PENGGUNAAN BANDWITH TERTINGGI" | lolcat
echo -e "${red}======================================${off}"
echo -e ""

vnstat -t

echo -e ""
echo -e "${red}======================================${off}"
echo -e "$baris2" | lolcat
;;

8)
echo -e "${red}======================================${off}"
echo -e " GRAFIK BANDWITH TERPAKAI SETIAP JAM" | lolcat
echo -e "${red}======================================${off}"
echo -e ""

vnstat -hg

echo -e ""
echo -e "${red}======================================${off}"
echo -e "$baris2" | lolcat
;;

9)
echo -e "${red}======================================${off}"
echo -e "  LIVE PENGGUNAAN BANDWITH SAAT INI" | lolcat
echo -e "${red}======================================${off}"
echo -e " ${white}CTRL+C Untuk Berhenti!${off}"
echo -e ""

vnstat -l

echo -e ""
echo -e "${red}======================================${off}"
echo -e "$baris2" | lolcat
;;

10)
echo -e "${red}======================================${off}"
echo -e "   LIVE TRAFIK PENGGUNAAN BANDWITH " | lolcat
echo -e "${red}======================================${off}"
echo -e ""

vnstat -tr

echo -e ""
echo -e "${red}======================================${off}"
echo -e "$baris2" | lolcat
;;

x)
sleep 1
menu
;;

*)
sleep 1
echo -e "${red}Nomor Yang Anda Masukkan Salah!${off}"
bw
;;
esac
