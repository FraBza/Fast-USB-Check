#!/bin/bash
#######################################################################################
## A shell script, which uses the Clamav open-source antivirus engine to scan a folder# 
#######################################################################################

rouge='\e[1;31m'
vert='\e[1;32m'
neutre='\e[0;m'

if [ "$UID" -eq "0" ]
then
    zenity --warning --height 80 --width 400 --title "EREUR" --text "Merci de lancez le script sans sudo : \n<b>./clamav.sh</b>\nVous devrez entrer le mot de passe root par la suite."
    exit
fi

which notify-send > /dev/null
if [ $? = 1 ]
then
	sudo apt install -y libnotify-bin
fi

which zenity > /dev/null
if [ $? = 1 ]
then
	sudo apt install -y zenity
fi

which clamav > /dev/null
if [ $? = 1 ]
then
	sudo apt install -y clamav clamav-daemon
fi

    echo ""
    echo " "

    echo "$vert [2/2]$rouge SCAN "
    for i in `seq 13 $COLUMNS`;
        do echo -n "."
    done
    echo " $neutre"
    echo > log_clamav.txt
    zenity --info --width=300 --height=100 --text "Choisisez la clé à scannée."
    notify-send -i system-software-update "Clamav" "Scan"
    inputStr=$(zenity --file-selection --directory "${HOME}")
    clamscan -r --remove --bell --log=log_clamav.txt $inputStr
    echo " "
	
    tail -n 12 log_clamav.txt | zenity --text-info --width=500 --height=500
	    notify-send -i dialog-ok "Clamav" "Scan terminé"
    	echo " "

    maldet --scan-all /media/utilisateur/ 
	tail -n 10  /usr/local/maldetect/event_log | zenity --text-info --width=1200 --height=500

        notify-send -i dialog-ok "MalDet" "Scan terminé"
	
echo " " 
