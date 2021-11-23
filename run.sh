#!/bin/bash

###################### HEAD ########################
wallet=""
version="1.2.4.1" 
####################################################



function center() {
    row=0
    echo ""
    col=$(( ($(tput cols) - ${#1}) / 2))
    tput clear
    tput cup $row $col
    echo "$1"
    echo ""
}

function highlight () {
    #
    #
    #
    # Black        0;30     Dark Gray     1;30
    # Red          0;31     Light Red     1;31
    # Green        0;32     Light Green   1;32
    # Brown/Orange 0;33     Yellow        1;33
    # Blue         0;34     Light Blue    1;34
    # Purple       0;35     Light Purple  1;35
    # Cyan         0;36     Light Cyan    1;36
    # Light Gray   0;37     White         1;37
    #
    #
    #
    if [ $2 == 'r' ];then
        col="\033[1;31m"
    elif [ $2 == 'y' ]; then
        col="\033[1;33m"
    elif [ $2 == 'g' ]; then
        col="\033[1;32m"
    elif [ $2 == 'w' ]; then
        col="\033[1;37m"
    else
        col=$2
    fi  
    if [ -z $3 ]; then
        head=''
    else
        head="[$3] "
    fi
    printf "$col$head$1\033[1;35m\n"; sleep 1
}

# -- start setup --
center "🦅"; sleep 1
highlight 'Start ...' 'w' 'setup'


# -- download the miner --
highlight 'Download miner ...' 'y' 'miner'
pkg="cpuminer-gr-$version-x86_64_linux.tar.gz"
wget "https://github.com/WyvernTKC/cpuminer-gr-avx2/releases/download/$version/$pkg" &&
highlight 'Decompress ...' 'y' 'miner'
tar -xvzf $pkg
wait
rm $pkg
highlight 'Done.' 'g' 'miner'


# -- service --
highlight 'Activate the watchdog? This will keep the miner alive in the background even after reboot. [y/n]'
