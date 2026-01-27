#!/bin/bash

function memory() {
     echo -e "\e[32m======================\e[35mMemory Status\e[32m=============================\e[0m"
     echo -e "\e[36myour memory status ===>\e[0m"
     echo " "
     free -h
     echo -e "\e[32m================================================================\e[0m"
}


function cpu_usage() {
    echo -e "\e[32m=========================\e[35mCPU Status\e[32m==============================\e[0m"
    echo -e "\e[36myour cpu uptime usage ====>\e[0m"
    echo " "
    uptime
    echo -e "\e[32m=================================================================\e[0m"
}


function harddrive() {
    echo -e "\e[32m=========================\e[35mHard Status\e[32m==========================\e[0m"
    echo -e "\e[36myour hard-drive space ====>\e[0m"
    echo " "
    df -h
    echo -e "\e[32m===============================================================\e[0m"
}

function kernel() {
    echo -e "\e[32m=========================\e[35mKernel Version\e[32m==========================\e[0m"
    echo -e "\e[36myour kernel version ====>\e[0m"
    echo " "
    uname -a
    echo -e "\e[32m=================================================================\e[0m"
}

clear
echo -e "what system status do you want to see?"
echo -e "use('\e[33mmemory\e[0m' '\e[32mcpu\e[0m' '\e[35mhard\e[0m' '\e[34mkernel\e[0m' '\e[36mall\e[0m')"
read status_input

while [[ -z "$status_input" ]]; do
	if ! command -v notify-send <& /dev/null &> 2&>1; then
	    echo -e "\e[33minstalling notf system\e[0m"
		sudo apt install -y libnotify-bin			
		clear
	fi
	notify-send "Wrong input: use('memory' or 'cpu' or 'hard' or 'kernel')"
	clear
	echo -e "what system status do you want to see?"
	echo -e "use('\e[33mmemory\e[0m' '\e[32mcpu\e[0m' '\e[35mhard\e[0m' '\e[34mkernel\e[0m' '\e[36mall\e[0m')"
	read status_input
done

case "$status_input" in
    "memory")
		clear
	    memory ;;

    "cpu")
		clear
	    cpu_usage ;;

    "hard")
    	clear
	    harddrive ;;

    "kernel")
    	clear
	    kernel ;;
	 
	"all")
		clear
		memory
		for i in {0..2}; do
			echo " "
		done
		echo -e "\e[33m________________________________________________________________________________\e[0m"
		echo -e "\e[33m________________________________________________________________________________\e[0m"
		echo -e "\e[33m________________________________________________________________________________\e[0m"
		for i in {0..3}; do
			echo " "
		done
		cpu_usage
		for i in {0..2}; do
			echo " "
		done
		echo -e "\e[33m________________________________________________________________________________\e[0m"
		echo -e "\e[33m________________________________________________________________________________\e[0m"
		echo -e "\e[33m________________________________________________________________________________\e[0m"
		for i in {0..3}; do
			echo " "
		done
		harddrive
		for i in {0..2}; do
			echo " "
		done
		echo -e "\e[33m________________________________________________________________________________\e[0m"
		echo -e "\e[33m________________________________________________________________________________\e[0m"
		echo -e "\e[33m________________________________________________________________________________\e[0m"
		for i in {0..3}; do
			echo " "
		done
		kernel ;;

    *)
		echo -e "Wrong input: use('\e[33mmemory\e[0m' '\e[32mcpu\e[0m' '\e[35mhard\e[0m' '\e[34mkernel\e[0m' '\e[36mall\e[0m')"
esac
