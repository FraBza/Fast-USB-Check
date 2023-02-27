#!/usr/bin/env bash
#######################################################################################
## A shell script, which uses the Clamav open-source antivirus engine to scan a folder# 
#######################################################################################

rouge='\e[1;31m'
vert='\e[1;32m'
neutre='\e[0;m'

#which clamav > /dev/null
#if [ $? = 1 ]
#then
#	sudo apt install -y clamav clamav-daemon
#fi
#
#    echo ""
#    echo " "
#
#    echo "$vert [2/2]$rouge SCAN "
#    for i in `seq 13 $COLUMNS`;
#        do echo -n "."
#    done
#    echo " $neutre"
#    echo > log_clamav.txt
#    zenity --info --width=300 --height=100 --text "Choisisez la clé à scannée."
#    notify-send -i system-software-update "Clamav" "Scan"
#    inputStr=$(zenity --file-selection --directory "${HOME}")
#    clamscan -r --remove --bell --log=log_clamav.txt $inputStr
#    echo " "
#	
#    tail -n 12 log_clamav.txt | zenity --text-info --width=500 --height=500
#	    notify-send -i dialog-ok "Clamav" "Scan terminé"
#    	echo " "
#
#    maldet --scan-all /media/utilisateur/ 
#	tail -n 10  /usr/local/maldetect/event_log | zenity --text-info --width=1200 --height=500
#
#        notify-send -i dialog-ok "MalDet" "Scan terminé"
#	
#echo " " 

function message_send() {
    notify-send -i $1 "$2" "$3"
}

function requirement() {
    _packages=(libnotify-bin zenity clamav clamav-daemon)
    _missing_package=false
    for package in ${!_packages[@]}; do

        local find_pachage=$(which ${_packages[${package}]} 2>/dev/null)
        if [[ -z ${find_pachage} ]]; then

            echo -e "Missing package : ${_packages[${package}]}"
            _missing_package=true

        fi

    done

    if [[ ${_missing_package} == true ]]; then

        exit 1

    fi
}

function scanner() {
    echo "$rouge SCAN "
    for i in `seq 13 $COLUMNS`;
        do echo -n "."
    done
    echo " $neutre"
    echo > log_clamav.txt
    zenity --info --width=300 --height=100 --text "Choisisez la clé à scannée."
    message_send "system-software-update" "Clamav" "Scan"
    inputStr=$(zenity --file-selection --directory "${HOME}")
    clamscan -r --remove --bell --log=log_clamav.txt $inputStr
    echo " "
	
    tail -n 12 log_clamav.txt | zenity --text-info --width=500 --height=500
	message_send "dialog-ok" "Clamav" "Scan terminé"
    echo " "

    maldet --scan-all /media/utilisateur/ 
	tail -n 10  /usr/local/maldetect/event_log | zenity --text-info --width=1200 --height=500

    message_send "dialog-ok" "MalDet" "Scan terminé"
}

function main() {
    requirement
    scanner
}

if [ "${EUID}" -ne "0" ]
then

    echo "Run this script as root"
    exit 1

fi

main