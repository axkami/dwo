#!/bin/bash

echo -e ""
echo -e "${red}======================================${off}"
echo -e        "           BANDWITH MONITOR " | lolcat
echo -e "${red}======================================${off}"
echo -e "${white}"
echo -e "     1 =>   See the total bandwidth remaining"
echo -e "     2 =>   Tabel Use Every 5 Minute"
echo -e "     3 =>   Tabel Use Every O'clock"
echo -e "     4 =>   Tabel Use Every Day"
echo -e "     5 =>   Tabel Use Every Month"
echo -e "     6 =>   Tabel Use Every Year"
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
echo -e "  Use BANDWITH Every 5 MENIT" | lolcat
echo -e "${red}======================================${off}"
echo -e ""

vnstat -5

echo -e ""
echo -e "${red}======================================${off}"
echo -e "$baris2" | lolcat
;;

3)
echo -e "${red}======================================${off}"
echo -e "    Use BANDWITH Every O'CLOCK" | lolcat
echo -e "${red}======================================${off}"
echo -e ""

vnstat -h

echo -e ""
echo -e "${red}======================================${off}"
echo -e "$baris2" | lolcat
;;

4)
echo -e "${red}======================================${off}"
echo -e "   Use BANDWITH Every DAY." | lolcat
echo -e "${red}======================================${off}"
echo -e ""

vnstat -d

echo -e ""
echo -e "${red}======================================${off}"
echo -e "$baris2" | lolcat
;;

5)
echo -e "${red}======================================${off}"
echo -e "   Use BANDWITH Every MONTH" | lolcat
echo -e "${red}======================================${off}"
echo -e ""

vnstat -m

echo -e ""
echo -e "${red}======================================${off}"
echo -e "$baris2" | lolcat
;;

6)
echo -e "${red}======================================${off}"
echo -e "   Use BANDWITH Every MONTH" | lolcat
echo -e "${red}======================================${off}"
echo -e ""

vnstat -y

echo -e ""
echo -e "${red}======================================${off}"
echo -e "$baris2" | lolcat
;;

7)
echo -e "${red}======================================${off}"
echo -e "    Use BANDWITH Highest" | lolcat
echo -e "${red}======================================${off}"
echo -e ""

vnstat -t

echo -e ""
echo -e "${red}======================================${off}"
echo -e "$baris2" | lolcat
;;

8)
echo -e "${red}======================================${off}"
echo -e " Bandwidth graph used every hour" | lolcat
echo -e "${red}======================================${off}"
echo -e ""

vnstat -hg

echo -e ""
echo -e "${red}======================================${off}"
echo -e "$baris2" | lolcat
;;

9)
echo -e "${red}======================================${off}"
echo -e "  Live Use bandwidth at this time" | lolcat
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
echo -e "   Live Traffic Use Bandwidth " | lolcat
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
echo -e "${red}The number you entered is wrong!{Off}"
bw
;;
esac
