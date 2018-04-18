#!/bin/bash                                                                                                                                     
# Script: Linux Configuration File                                             
# Description: LCF is a simple script to personalize your Linux distro as H4M1O.
# Version: 3.4.5                                                               
# Date: 18-04-2018                                                               
# Author: Claudio Proietti                                                       
# License: The MIT License (MIT) - Copyright (c) 2017 Claudio Proietti

function main ()
{                                                                                    
    # control if sudo is installed and usable
    sudo echo "Testing sudo!" >> /dev/null
    if [ $? -eq 0 ] ; then
        SU="sudo"
        echo "Sudo installed!!!" >> /dev/null
    else
        SU=""
        echo "Sudo not installed!!!" >> /dev/null
    fi
    
    # This is the main function that show the menu and allows the user to make a choice
    # declared integer for user's choice                                             
    clear                                                                            
    declare -i OPT                                                                   
    while true                                                                       
    do                                                                               
        menu                                                                         
        # read input from keyboard                                                   
        read OPT                                                                     
        if [ "$OPT" -ge 0 -a "$OPT" -le 9 ]                                              
        then                                                                         
            case $OPT in                                                             
                1 ) 
                os_update $SU                                                 
                echo -e "$(tput setaf 0)$(tput setab 2)\nSYSTEM UPDATE AND UPGRADE COMPLETED!$(tput sgr 0)\n"
                ;;                                                                   
                2 )
                base_cfg $SU
                echo -e "$(tput setaf 0)$(tput setab 2)\nBASIC INSTALLATION AND CONFIGURATION (BASHRC, VIMRC, TOP, TMUX) COMPLETED!$(tput sgr 0)\n"                
                ;;
                3 )
                work_apps $SU
                echo -e "$(tput setaf 0)$(tput setab 2)\nWORK TOOLS INSTALLATION AND CONFIGURATION (NMAP, HTOP, LNAV...)$(tput sgr 0)\n"                
                ;;
                4 )
                other_apps $SU
                echo -e "$(tput setaf 0)$(tput setab 2)\nDESKTOP TOOLS INSTALLATION AND CONFIGURATION (I3, SPOTIFY, CHROMIUM...)$(tput sgr 0)\n"                
                ;;
                5 )
                all_apps_up $SU
                echo -e "$(tput setaf 0)$(tput setab 2)\nINSTALLATION AND CONFIGURATION OF THE HYPERVISORS COMPLETED!$(tput sgr 0)\n"                
                ;;
                6 )
                all_apps_up $SU
                echo -e "$(tput setaf 0)$(tput setab 2)\nINSTALLATION AND CONFIGURATION OF ALL THE APPS WITH OS UPDATE COMPLETED!$(tput sgr 0)\n"                
                ;;
                7 )
                all_apps_noup $SU                                                   
                echo -e "$(tput setaf 0)$(tput setab 2)\nINSTALLATION AND CONFIGURATION OF ALL THE APPS WITHOUT OS UPDATE COMPLETED!$(tput sgr 0)\n"
                ;;                 
                0 ) clear
                echo -e "$(tput setaf 7)$(tput setab 0)\nThank you for using this script!$(tput sgr 0)\n"
                exit 1
                ;;                                                                   
            esac                                                                     
        else                                                                         
            echo "$OPT"                                                                
            clear                                                                    
            echo -e "$(tput setaf 7)$(tput setab 1)ATTENTION: You have inserted the wrong option!!!$(tput sgr 0)\n"
        fi                                                                           
    done                                                                             
}                              

function menu ()
{ 
    # The scope of this function is only to show the contextual menu                 
    echo "$(tput setaf 3)$(tput bold)Welcome to L.C.F. - Linux Configuration Files"
    echo -e "Script created by Claudio Proietti under MIT license$(tput sgr 0)\n"
    echo -e "These are the available options:\n"                                 
    echo "1 - UPDATE AND UPGRADE THE SYSTEM"       
    echo "2 - BASIC INSTALLATION AND CONFIGURATION (BASHRC, VIMRC, TOP, TMUX)"
    echo "3 - WORK TOOLS INSTALLATION AND CONFIGURATION (NMAP, HTOP, LNAV...)"
    echo "4 - DESKTOP TOOLS INSTALLATION AND CONFIGURATION (I3, SPOTIFY, CHROMIUM...)"
    echo "5 - HYPERVISORS (LXD, DOCKER...)"
    echo "6 - INSTALL AND CONFIGURE ALL THE APPS WITH OS UPDATE"
    echo "7 - INSTALL AND CONFIGURE ALL THE APPS WITHOUT OS UPDATE"
    echo -e "\n0 - Exit the script\n"                                            
    echo "$(tput setaf 3)Write now the option that you want select and press enter: $(tput sgr 0)"  
}      

function os_update ()
{
    # update the repos and do a sit-upgrade
    $1 apt-get update 
    $1 apt-get dist-upgrade -y
}

function base_cfg ()
{
    # copy .bashrc base
    cp .bashrc ~/.bashrc
    source ~/.bashrc
    # copy .toprc config
    cp .toprc ~/
    # install curl
    $1 apt-get install curl -y
    # install and configure GIT
    $1 apt-get install git -y
    git config --global push.followTags true
    git config --global user.name "H4M1O"
    git config --global user.email "claudio.proietti@gmail.com"
    # install and configure VIM
    $1 apt-get install vim -y
    cp -r .vim ~/
    cp .vimrc ~/
    cp .plugins_vim ~/
    # install and configure TMUX
    $1 apt-get install tmux -y
    $1 apt-get install highlight -y
    cp .tmux.conf ~/
	$1 add-apt-repository ppa:apt-fast/stable -y
	$1 apt-get update
	$1 apt-get install apt-fast -y 
}

function work_apps ()
{
    # install networking and sysadmin tools
    $1 apt-get install bmon tcptrack slurm minicom glances lnav iotop htop -y
    # install rdp software remmina
    $1 apt-get install unzip -y
    # install GPG
    $1 apt-get install gnupg2 -y
    # install NMap and ZMap
    $1 apt-get install nmap zmap -y
    $1 apt-get install python3-dev python3-pip python-pkg-resources -y
    $1 apt-get install python-pip -y
    $1 pip install --upgrade pip
	$1 apt-get install virtualenv -y
	$1 apt-get install idle3 -y
}

function other_apps ()
{
    $1 cp -r Wallpapers ~/
    # install software to show the fancy dragon when opening the terminal
    $1 apt-get install cmatrix cowsay fortune lolcat -y
    # install graphical control software
    $1 apt-get install xbacklight feh arandr shutter -y 
    # install rdp software remmina
    $1 apt-get install remmina -y
    # install keepass2
    $1 add-apt-repository ppa:eugenesan/ppa -y
    $1 apt-get update
    $1 apt-get install keepass2 -y
    # install spotify
    $1 apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
    $1 echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
    $1 apt-get update
    $1 apt-get install spotify-client -y
    # install other browsers
    $1 apt-get install chromium-browser -y
    # install vlc
    $1 apt-get install vlc -y 
}

function hypervisors ()
{
    # install lxd and docker
    $1 add-apt-repository ppa:ubuntu-lxc/lxd-stable -y
    $1 apt-get update
    $1 apt-get dist-upgrade -y
    $1 apt-get install lxd -y
    # install Docker
    $1 apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
    $1 apt-get update
    $1 apt-get install docker.io -y
    # add the user to the new groups docker and lxd
    if [ $(whoami) != "root" ]; then
        usermod -aG docker $(whoami)
        usermod -aG lxd $(whoami)
    fi
}

function all_apps_up ()
{
    os_update "$1"
    base_cfg "$1"
    work_apps "$1"
    other_apps "$1"
	hypervisors "$1"
}

function all_apps_noup ()
{
    base_cfg "$1"
    work_apps "$1"
    other_apps "$1"
	hypervisors "$1"
}

#Call to the main function
main
