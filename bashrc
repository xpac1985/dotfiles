# To enable the settings / commands in this file for login shells as well, this file has to be sourced in /etc/profile.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize

# always follow symlinks to real target
set -o physical

# export and define the prompt command to display last return value and use a different color for root
export PROMPT_COMMAND=__prompt_command

function __prompt_command() {
  ### 0 = black, 1 = red, 2 = green, 3 = yellow
  ### 4 = blue, 5 = violet, 6 = cyan, 7 = white
  local EXIT="$?"
  local HOST_COLOR="3"
  
  PS1="\[$(tput bold)\]\[$(tput setaf 7)\]\t "
  if [ $EXIT != 0 ]; then
     PS1+="\[$(tput setaf 1)\]"
  else
     PS1+="\[$(tput setaf 2)\]"
  fi
  
  PS1+="\$? \[$(tput setaf 7)\]["
  
  if [ $EUID != 0 ]; then
    PS1+="\[$(tput setaf 7)\]\u"
  else
    PS1+="\[$(tput setaf 1)\]\u"
  fi
  
  PS1+="\[$(tput setaf 7)\]@\[$(tput setaf $HOST_COLOR)\]\h\[$(tput setaf 7)\]] \[$(tput setaf 2)\]\$PWD \[$(tput setaf 4)\]\\$ \[$(tput sgr0)\]"

  history -a  
}

# use ALL the colors!
export TERM=xterm-256color

# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found -o -x /usr/share/command-not-found/command-not-found ]; then
  function command_not_found_handle {
    # check because c-n-f could've been removed in the meantime
    if [ -x /usr/lib/command-not-found ]; then
      /usr/bin/python /usr/lib/command-not-found -- "$1"
      return $?
    elif [ -x /usr/share/command-not-found/command-not-found ]; then
      /usr/bin/python /usr/share/command-not-found/command-not-found -- "$1"
      return $?
    else
      printf "%s: command not found\n" "$1" >&2
      return 127
    fi
  }
fi

if [ ! -f /opt/splunk/bin/setSplunkEnv ]; then
  source /opt/splunk/bin/setSplunkEnv
fi

if [ ! -f /opt/splunkforwarder/bin/setSplunkEnv ]; then
  source /opt/splunkforwarder/bin/setSplunkEnv
fi

# shortcut to create backup of a file
function bu() {
    cp $@ $@.`date +%y%m%d`~;
}

# ls
export LS_OPTIONS='--color=auto -h --group-directories-first'
alias ls='ls $LS_OPTIONS'
alias l='ls -lAB'
alias ll='ls -lA'
alias lls='ll --sort=size'
alias llt='ll --sort=time'

# cd
shopt -s autocd
shopt -s cdspell

# history
HISTFILESIZE=1000000
HISTSIZE=1000000
HISTCONTROL=ignoreboth
HISTIGNORE='ls:bg:fg:history'
HISTTIMEFORMAT='%F %T '
shopt -s cmdhist
shopt -s histappend
shopt -s histverify

# shell options
shopt -s extglob
shopt -s globstar

# tmux TERM fix
alias tmux='TERM=screen-256color tmux'

# grep
alias grepex='grep -P'

# nano
alias nano='vim'

# less should use ANSI color codes
export LESS='-R'
