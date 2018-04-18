# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# enable to use a secondary file for private content
source ~/.sec_alias

# enable smart auto-completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# enable colored terminal and enable the possibilty to run script on the pwd
export PATH=$PATH:/usr/games/:./

# enable colored terminal
export TERM=xterm-256color

# import the SSH_AUTH_SOCK
SSH_AUTH_SOCK=`find /tmp/ -type s -name agent.\* 2> /dev/null | grep '/tmp/ssh-.*/agent.*'`

# export the configuration on every shell
shopt -s expand_aliases

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

export HISTCONTROL=ignoreboth:erasedups  # no duplicate entries at all
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# change the color of the user on PS1 if is different from root
if [ $(whoami) != "root" ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[00m\]\A\[\033[00m\]-\[\033[01;32m\]\u\[\033[00m\]@\[\033[01;33m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$ '
else 
    PS1='${debian_chroot:+($debian_chroot)}\[\033[00m\]\A\[\033[00m\]-\[\033[01;31m\]\u\[\033[00m\]@\[\033[01;33m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$ '
fi

new_ssh_agent()
{
	if [ -z $SSH_AUTH_SOCK ]
	then
		eval $(ssh-agent) > /dev/null && ssh-add $1
	else
		ssh-add $1
	fi
}

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# call alias with a
alias a='alias'

# clear the screen
alias c='source ~/.bashrc && clear'

#call cd shortcuts 
alias c.='cd ..'
alias c..='cd ../..'
alias c...='cd ../../..'
alias c....='cd ../../../..'
alias c.....='cd ../../../../..'

# call cat with highlights
cats() { highlight -O xterm256 -s molokai -l $1 | less -R; }

# call du for directory space
alias d='du -sh'

# call exit
alias e='exit'

# call df for disk space
alias f='df -h'

# short commands for GIT
alias ga='git add '
alias gb='git branch '
alias gc='git commit -m '
alias gd='git diff'
alias go='git checkout '
alias gs='git status '
alias gh='git stash'
alias gt='git tag '

#alias ll='ls -alF'
alias ls='ls --color=auto'
alias ll='ls -lah --color=auto --group-directories-first'
alias la='ls -A'

# call SSH agent, add a key and call ssh
alias k=new_ssh_agent

# add another SSH key`
alias ka='ssh-add'

# kill the ssh agent
alias kk='sudo killall ssh-agent && source ~/.bashrc && clear'

# show the list of the SSH keys loaded
alias kl='ssh-add -l'

# push the .bashrc over ssh in .cpbashrc
alias s='ssh'

# enable alias on sudo
alias sudo='sudo '

# call tmux
alias t='tmux'

# call top
alias tt='top'

# call VIM
alias v='vim'

# call watch and enable the use of alias with it
alias wa='watch '
