#!/bin/bash                                                                                                                                     
# Script: Linux Configuration File                                             
# Description: LCF is a simple script to personalize your Linux distro as H4M1O.
# Version: 2.0.1                                                                 
# Date: 26-05-2016                                                               
# Author: Claudio Proietti                                                       
# License: The MIT License (MIT) - Copyright (c) 2016 Claudio Proietti

function main ()                                                                                                                                 {                                                                                    
    # This is the main function that show the menu and allows the user to make a choice
    # declared integer for user's choice                                             
    sudo apt-get update 
    sudo apt-get upgrade -y
    clear                                                                            
    declare -i OPT                                                                   
    while true                                                                       
    do                                                                               
        menu                                                                         
        # read input from keyboard                                                   
        read OPT                                                                     
        if [ $OPT -ge 0 -a $OPT -le 6 ]                                              
        then                                                                         
            case $OPT in                                                             
                1 ) bash_cfg                                                     
                echo -e "$(tput setaf 0)$(tput setab 2)\nBASH CONFIGURATION COMPLETED!$(tput sgr 0)\n"
                ;;                                                                   
                2 ) vim_cfg
                echo -e "$(tput setaf 0)$(tput setab 2)\nVIM INSTALLATION AND CONFIGURATION COMPLETED!$(tput sgr 0)\n"                
                ;;
                3 ) tmux_cfg                                                     
                echo -e "$(tput setaf 0)$(tput setab 2)\nTMUX INSTALLATION AND CONFIGURATION COMPLETED!$(tput sgr 0)\n"
                ;;                                                                   
                4 ) i3_cfg
                echo -e "$(tput setaf 0)$(tput setab 2)\nI3 INSTALLATION AND CONFIGURATION COMPLETED!$(tput sgr 0)\n"                
                ;;
                5 ) sec_cfg                                                     
                echo -e "$(tput setaf 0)$(tput setab 2)\nSECURITY INSTALLATION AND CONFIGURATION COMPLETED!$(tput sgr 0)\n"
                ;;                                                                   
                6 ) all_cfg
                echo -e "$(tput setaf 0)$(tput setab 2)\nAPPS INSTALLATION AND CONFIGURATION COMPLETED!$(tput sgr 0)\n"
		exit 1                
                ;;
                0 ) clear                                                            
                echo -e "$(tput setaf 7)$(tput setab 0)\nThank you for using this script!$(tput sgr 0)\n"
                exit 1                                                               
                ;;                                                                   
            esac                                                                     
        else                                                                         
            echo $OPT                                                                
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
    echo "1 - CONFIGURE BASH"       
    echo "2 - INSTALL AND CONFIGURE VIM" 
    echo "3 - INSTALL AND CONFIGURE TMUX"       
    echo "4 - INSTALL AND CONFIGURE I3" 
    echo "5 - INSTALL AND CONFIGURE SSH" 
    echo "6 - INSTALL AND CONFIGURE ALL THE APPS" 
    echo -e "\n0 - Exit the script\n"                                            
    echo "$(tput setaf 3)Write now the option that you want select and press enter: $(tput sgr 0)"  
}      

function bash_cfg ()
{
    cp .bashrc ~/
    source ~/.bashrc
}

function vim_cfg ()
{
    sudo apt-get install vim
    cp -r .vim ~/
    cp .vimrc ~/
    cp .plugins_vim ~/
}

function tmux_cfg ()
{
    sudo apt-get install tmux
    cp .tmux.conf ~/
}

function i3_cfg ()
{
    sudo apt-get install i3
    cp -r .i3 ~/
    sudo cp etc/i3status.conf /etc/i3status.conf
}

function sec_cfg ()
{
    sudo apt-get install openssl-client
    ssh-keygen -b 4096 -t rsa
}

function all_cfg ()
{
    bash_cfg
    vim_cfg
    tmux_cfg
    i3_cfg
    sec_cfg
}

#Call to the main function
main
