#!/bin/bash                                                                                                                                     
# Script: Linux Configuration File                                             
# Description: LCF is a simple script to personalize your Linux distro as H4M1O.
# Version: 2.10.17                                                                 
# Date: 12-02-2017                                                               
# Author: Claudio Proietti                                                       
# License: The MIT License (MIT) - Copyright (c) 2016 Claudio Proietti

function main ()
{                                                                                    
    # control the OS to determine if is Ubuntu or Debian
    #uname -a | egrep Ubuntu
    #if [ $? -eq 0 ] ; then
    #    SO=0
    #    echo "Ubuntu installed!!!"
    #else
    #    SO=1
    #    echo "Debian installed!!!"
    #fi

    # control if sudo is installed and usable
    sudo echo "Testing sudo!" >> /dev/null
    if [ $? -eq 0 ] ; then
        SU="sudo"
        echo "Sudo installed!!!"
    else
        SU=""
        echo "Sudo not installed!!!"
    fi

    # This is the main function that show the menu and allows the user to make a choice
    # declared integer for user's choice                                             
    $SU apt-get update 
    $SU apt-get dist-upgrade -y
    
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
                bash_cfg                                                     
                echo -e "$(tput setaf 0)$(tput setab 2)\nBASH CONFIGURATION COMPLETED!$(tput sgr 0)\n"
                ;;                                                                   
                2 )
                gac_cfg $SU
                echo -e "$(tput setaf 0)$(tput setab 2)\nGIT AND CURL INSTALLATION AND CONFIGURATION COMPLETED!$(tput sgr 0)\n"                
                ;;
                3 )
                vim_cfg $SU
                echo -e "$(tput setaf 0)$(tput setab 2)\nVIM INSTALLATION AND CONFIGURATION COMPLETED!$(tput sgr 0)\n"                
                ;;
                4 )
                tmux_cfg $SU                                                    
                echo -e "$(tput setaf 0)$(tput setab 2)\nTMUX INSTALLATION AND CONFIGURATION COMPLETED!$(tput sgr 0)\n"
                ;;                                                                   
                5 )
                i3_cfg $SU
                echo -e "$(tput setaf 0)$(tput setab 2)\nI3 INSTALLATION AND CONFIGURATION COMPLETED!$(tput sgr 0)\n"                
                ;;
                6 )
                sec_cfg $SU                                                    
                echo -e "$(tput setaf 0)$(tput setab 2)\nSECURITY INSTALLATION AND CONFIGURATION COMPLETED!$(tput sgr 0)\n"
                ;;                                                                   
                7 ) 
                com_cfg $SU
                echo -e "$(tput setaf 0)$(tput setab 2)\nCOMMON APPS INSTALLATION AND CONFIGURATION COMPLETED!$(tput sgr 0)\n"
                exit 1                
                ;;
                8 ) 
                root_cfg
                echo -e "$(tput setaf 0)$(tput setab 2)\nAPPS INSTALLATION AND CONFIGURATION COMPLETED!$(tput sgr 0)\n"
                exit 1                
                ;;
                9 ) $SU user_inst
                user_cfg $SU
                echo -e "$(tput setaf 0)$(tput setab 2)\nAPPS INSTALLATION AND CONFIGURATION COMPLETED!$(tput sgr 0)\n"
                exit 1                
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
    echo "1 - CONFIGURE BASH AND TOP"       
    echo "2 - INSTALL AND CONFIGURE GIT AND CURL" 
    echo "3 - INSTALL AND CONFIGURE VIM" 
    echo "4 - INSTALL AND CONFIGURE TMUX"       
    echo "5 - INSTALL AND CONFIGURE I3 (Requires sudo to work!)"
    echo "6 - INSTALL AND CONFIGURE SSH" 
    echo "7 - INSTALL AND CONFIGURE ALL THE COMMON APPS (Chromium, Spotify, etc.)"
    echo "8 - INSTALL AND CONFIGURE ALL THE APPS FOR ROOT (NO SUDO!!! NO SSH!!!)"
    echo "9 - INSTALL AND CONFIGURE ALL THE APPS FOR A STANDARD USER (Require root or sudo! NO SSH!!!)" 
    echo -e "\n0 - Exit the script\n"                                            
    echo "$(tput setaf 3)Write now the option that you want select and press enter: $(tput sgr 0)"  
}      

function bash_cfg ()
{
    cp .bashrc ~/
    source ~/.bashrc
    cp .toprc ~/
    cp .ssh_push.sh ~/
}

function gac_cfg ()
{
    $1 apt-get install curl -y
    $1 apt-get install git -y
}

function vim_cfg ()
{
    $1 apt-get install vim -y
    cp -r .vim ~/
    cp .vimrc ~/
    cp .plugins_vim ~/
    # mkdir ~/.vim/.undo
    # mkdir ~/.vim/.backup
    # mkdir ~/.vim/.swap
    neb_cfg "$1"
}

function tmux_cfg ()
{
    $1 apt-get install tmux -y
    cp .tmux.conf ~/
}

function i3_cfg ()
{
    $1 apt-get install i3 -y
    cp -r .i3 ~/
    $1 cp etc/i3status.conf /etc/i3status.conf
    $1 cp ./reboot.sh ~/
    $1 cp ./shutdown.sh ~/
    $1 cp -r Wallpapers ~/
}

function sec_cfg ()
{
    $1 apt-get install openssl-client -y
    ssh-keygen -b 4096 -t rsa
}

function neb_cfg ()
{    
    #!/bin/sh
    # Standalone installer for Unixs
    # Original version is created by shoma2da
    # https://github.com/shoma2da/neobundle_installer
    # Installation directory
    BUNDLE_DIR=~/.vim/bundle
    INSTALL_DIR="$BUNDLE_DIR/neobundle.vim"
    echo "$INSTALL_DIR"
    if [ -e "$INSTALL_DIR" ]; then
        echo "$INSTALL_DIR already exists!"
    fi

    # make bundle dir and fetch neobundle
    # echo "Begin fetching NeoBundle..."
    if ! [ -e "$INSTALL_DIR" ]; then
        mkdir -p "$BUNDLE_DIR"
        git clone https://github.com/Shougo/neobundle.vim "$INSTALL_DIR"
    fi
    # cp -R .vim ~/.vim
    cp .plugins_vim ~/.plugins_vim
}

function com_cfg ()
{
    # commands to install spotify
    $1 apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
    $1 echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
    $1 apt-get update
    $1 apt-get install spotify-client -y
    # Install other apps
    $1 apt-get install chromium-browser arandr shutter vlc -y 
    $1 apt-get install bmon tcptrack slurm minicom feh -y
    $1 apt-get install glances lnav iotop -y
    $1 apt-get install remmina google-chrome-stable -y
    $1 apt-get install xbacklight -y
    $1 apt-get install python3-dev python3-pip python-pkg-resources -y
    $1 apt-get install python-pip -y
    $1 pip install --upgrade pip
    #$1 apt-get -H pip3 install thefuck
    $1 apt-get install cmatrix sl lolcat ddate cowsay fortune-mod -y
    $1 pip install thefuck
}

function root_cfg ()
{
    bash_cfg
    vim_cfg
    tmux_cfg
    i3_cfg
    com_cfg
    # sec_cfg
}

function user_cfg ()
{
    bash_cfg "$1"
    vim_cfg "$1"
    tmux_cfg "$1"
    i3_cfg "$1"
    com_cfg "$1"
    # sec_cfg "$1"
}

#Call to the main function
main
