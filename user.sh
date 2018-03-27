#!/bin/bash
#set the prompt to show you are in pentmenu and not standard shell
PS3="Pentmenu>"

##MAINMENU##
##################
##START MAINMENU##
mainmenu()
{
#build a main menu using bash select
#from here, the various sub menus can be selected and from them, modules can be run
mainmenu=("Fake_ip" "Quit")
select opt in "${mainmenu[@]}"; do
	if [ "$opt" = "Quit" ]; then
	echo "Quitting...Thank you for using pentmenu!" && sleep 1 && clear
	exit 0
	elif [ "$opt" = "Fake_ip" ]; then
distractionscan
	else
   exit
   fi
done
}

##WELCOME##
#########################
distractionscan()
{ echo "This module will send a TCP SYN scan with a spoofed source address"
echo "This module is designed to be obvious, to distract your target from any real scan or other activity you may actually be performing"
echo "Enter target:"
#need target IP/hostname
read -i $TARGET -e TARGET
echo "Enter spoofed source address:"
#need a spoofed source address
read -i $SOURCE -e SOURCE
#use hping to perform multiple obvious TCP SYN scans
for i in {1..30}; do echo "sending scan $i" && sudo hping3 --scan all --spoof $SOURCE -S $TARGET 2>/dev/null 1>/dev/null; done
exit 0
}

echo "Welcome to install fake ip address!"
echo "Please report all bugs, improvements and suggestions to https://github.com/GinjaChris/pentmenu/issues"
echo "This software is only for responsible, authorised use."
echo "YOU are responsible for your own actions!"
echo ""
mainmenu
##END WELCOME MESSAGE##
#######################
##/WELCOME##
