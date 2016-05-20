#!/bin/bash                                                                                                                                     
# Script: Linux Configuration File                                             
# Description: LCF is a simple script to personalize your Linux distro as H4M1O.
# Version: 1.0.0                                                                 
# Date: 20-05-2016                                                               
# Author: Claudio Proietti                                                       
# License: The MIT License (MIT) - Copyright (c) 2016 Claudio Proietti

function main ()                                                                                                                                     
{                                                                                    
    # This is the main function that show the menu and allows the user to make a choice
    # declared integer for user's choice                                             
    clear                                                                            
    declare -i OPT                                                                   
    while true                                                                       
    do                                                                               
        menu                                                                         
        # read input from keyboard                                                   
        read OPT                                                                     
        if [ $OPT -ge 0 -a $OPT -le 2 ]                                              
        then                                                                         
            case $OPT in                                                             
                1 ) install                                                     
                echo -e "$(tput setaf 0)$(tput setab 2)\nAPPS INSTALLATION COMPLETED!$(tput sgr 0)\n"
                ;;                                                                   
                2 ) configure
                echo -e "$(tput setaf 0)$(tput setab 2)\nAPPS CONFIGURATION COMPLETED!$(tput sgr 0)\n"                
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

function menu ()                                                                                                                                {                                                                                
# The scope of this function is only to show the contextual menu                 
    echo "$(tput setaf 3)$(tput bold)Welcome to L.C.F. - Linux Configuration Files"
    echo -e "Script created by Claudio Proietti under MIT license$(tput sgr 0)\n"
    echo -e "These are the available options:\n"                                 
    echo "1 - INSTALL APPLICATION (Only with ROOT and install VIM, I3 and TMUX)"       
    echo "2 - CONFIGURE APPS (With current user and it can be used with root)" 
    echo -e "\n0 - Exit the script\n"                                            
    echo "$(tput setaf 3)Write now the option that you want select and press enter: $(tput sgr 0)"  
}      

function install ()
{
    apt-get update
    apt-get upgrade -y
    apt-get install vim i3 tmux -y
}

function configure ()
{
    mkdir ~/.vim/bundle ~/.vim/colors ~/.vim/.backup ~/.vim/.undo ~/.vim/.swap
    mkdir ~/.i3
    cp -fv molokai/colors/molokai.vim ~/.vim/colors
    cp -fv .vimrc ~/
    cp -fv .plugins_vim ~/
    cp -fv .i3/config ~/.i3/
    cp -R neobundle.vim ~.vim/
}

#Call to the main function
main
