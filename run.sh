#!/bin/bash

###################### HEAD ########################
name="TheBoyz"
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


# -- PATHS --
center "🦅"; sleep 1
cd $HOME
installPath="$HOME/$name"
pkg="cpuminer-gr-$version-x86_64_linux.tar.gz"
minerPath=$installPath/${pkg//".tar.gz"/}
startPath=$minerPath/cpuminer.sh
configPath=$minerPath/config.json

# -- check for uninstall --
if [ -z "$1" ];then
    echo
else
    if [ "uninstall" == "$1" ]; then
        if [ -d $installPath ]; then
            highlight 'trigger uninstall ...' 'y' 'setup'
            highlight "are you sure to uninstall $name? [y/n]" 'y' 'setup'
            read i
            if [ $i == "y" ];then
                highlight "delete $name directory ..." 'y' 'setup'
                rm -r $installPath &&
                highlight "remove alias ..." 'y' 'setup'
                sed -i 's/alias boyz=.*/ /' $HOME/.bashrc &&
                highlight "removed $name from the system." 'g' 'setup'
            else
                highlight "abort." 'r' 'setup'
            return
        else
            highlight "No $name installation found on this profile - exit." 'r' 'setup'
        fi
    else
        highlight "Command '$1' not found." 'r'
    fi
fi

# -- start setup --
if [ ! -d $installPath ]; then
    highlight 'Start ...' 'w' 'setup' && 
    highlight "Setup directory at $installPath ..." 'y' 'setup' &&
    mkdir $installPath &&
    cd $installPath
    sleep 1
    highlight 'Download miner ...' 'y' 'miner'
    wget "https://github.com/WyvernTKC/cpuminer-gr-avx2/releases/download/$version/$pkg" &&
    highlight 'Decompress ...' 'y' 'miner'
    tar -xvzf $pkg
    wait
    rm $pkg
    highlight 'Done.' 'g' 'miner'
    # create executable &
    # add alias for cli
    touch "$installPath/$name.sh"
    highlight 'set environment variable...' 'y' $name
    echo "alias $name='/bin/bash $installPath/$name.sh'" >> $HOME/.bashrc && source $HOME/.bashrc &&
    highlight 'done.' 'g' $name
else
    highlight 'Installation found.' 'g' 'setup'
fi

# -- configure --
highlight 'Continue with direct configuration? [y/n]' 'y' 'setup'
read i 
if [ $i == 'y' ]; then
highlight '...' 'y' 'config'
highlight 'Paste [CTRL+SHIFT+V] a valid Raptoreum wallet address and press enter:' 'y' 'config'
read wallet
highlight 'Insert a worker name and press enter:' 'y' 'config'
read worker
sed -i 's/  "user".*/ "user": "'$wallet'.'$worker'",/' $configPath &&

# -- service --
highlight 'Activate the watchdog? This will keep the miner alive and will run in the background even after reboot. No console output. [y/n]' 'y' 'watchdog'
read i 
if [ $i == 'y' ]; then
    highlight 'Setting up daemon in system service ...' 'y' 'watchdog'
    # custom daemon service
    cat >/tmp/$name.service <<EOL
  [Unit]
Description=$name Watchdog
[Service]
ExecStart=$minerPath --config=$minerPath/config.json
Restart=always
Nice=8
CPUWeight=1
[Install]
WantedBy=multi-user.target
EOL
    sudo mv /tmp/$name.service /etc/systemd/system/$name.service
    sudo systemctl enable $name.service
    sudo systemctl start $name.service
    highlight 'Done.' 'g' 'watchdog'
else
    highlight 'Skipping watchdog.' 'w' 'setup'
fi

# -- Hook if service is declined --
else
    highlight "Skipping configuration. The miner can be configured manually in $minerPath/config.json." 'w' 'setup'
fi

# -- ask to start miner if daemon is skipped --
if [ $i != 'y' ]; then
    highlight 'Start the miner in this console? [y/n]' 'y' 'miner'
    read i 
    if [ $i == 'y' ]; then
        highlight 'Invoke mining workload ...' '\033[0;33m' 'miner'
        sudo /bin/bash $startPath
    else
        highlight 'Finished.' 'w' 'setup'
    fi
else
    highlight 'Finished.' 'w' 'setup'
fi

