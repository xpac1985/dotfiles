# To enable the settings / commands in this file for login shells as well,
# this file has to be sourced in /etc/profile.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# export and define the prompt command to display last return value and use a different color for root
export PROMPT_COMMAND=__prompt_command

function __prompt_command() {
    local EXIT="$?"
    local HOST_COLOR="0;38;05;202m"
    if [ $EXIT != 0 ]; then
         PS1="\[\e[1;97m\]\t \[\e[0;31m\]\$?\[\e[0;37m\] "
    else
         PS1="\[\e[1;97m\]\t \[\e[0;32m\]\$?\[\e[0;37m\] "
    fi
    if [ $EUID != 0 ]; then
        PS1+="\[\e[0;32m\]\u\[\e[1;37m\]@\[\e[$HOST_COLOR\]\h \[\e[0;33m\]\w \[\e[1;37m\]\\$\[\e[0m\] "
    else
        PS1+="\[\e[1;38;05;160m\]\u\[\e[1;37m\]@\[\e[$HOST_COLOR\]\h \[\e[0;33m\]\w \[\e[1;37m\]\\$\[\e[0m\] "
    fi
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

# shortcut to create backup of a file
function bu() {
    cp $@ $@.`date +%y%m%d`~;
}



