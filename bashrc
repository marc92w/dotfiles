# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  # We have color support; assume it's compliant with Ecma-48
  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
  # a case would tend to support setf rather than setaf.)
  color_prompt=yes
    else
  color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w \$\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# for colored manual pages
export LESS_TERMCAP_mb=$'\E[01;31m' # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m' # begin bold
export LESS_TERMCAP_me=$'\E[0m' # end mode
export LESS_TERMCAP_se=$'\E[0m' # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m' # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m' # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

#logo and greeting
echo -e "\n";
echo -e "\033[1;31m       \$\$\$\$\$\$\$                                         \$";          
echo -e "\033[1;31m    \$\$\$\$     \$\$\$\$ \033[0m          MMM           MMM \033[1;31m       \$\$\$\$\$";                  
echo -e "\033[1;31m   \$\$          \$\$\$  \033[0m        MMM           MMM   \033[1;31m       \$";                
echo -e "\033[1;31m  \$\$      \$\$\$   \$\$ \033[0m         MMM           MMM";                            
echo -e "\033[1;31m \$\$     \$       \$\$   \033[0m  MMMMMMMM   MMMMMM  MMM MMMMM   MMM  MMMMMMMM   M MMMMMMM";
echo -e "\033[1;31m \$\$     \$       \$\$   \033[0m MMM   MMM  MM    MM MMMM   MMM  MMM  M     MM   MMM    MM";
echo -e "\033[1;31m \$      \$       \$  \033[0m  MMM    MMM MMM    MM MMM    MMM  MMM        MM   MMM    MM";
echo -e "\033[1;31m \$       \$    \$\$  \033[0m   MMM    MMM MMMMMMMMM MMM     MM  MMM   MMMMMMM   MMM    MM"; 
echo -e "\033[1;31m \$\$       \$\$\$\$  \033[0m     MMM    MMM MMM       MMM     MM  MMM MMM    MM   MMM    MM"; 
echo -e "\033[1;31m  \$\$                \033[0m MMM    MMM MMM       MMM    MMM  MMM MMM    MM   MMM    MM";
echo -e "\033[1;31m   \$\$               \033[0m  MMM   MMM  MMM      MMM    MM   MMM MMM   MMM   MMM    MM"; 
echo -e "\033[1;31m     \$\$              \033[0m  MMMMMMMM   MMMMMMM MMMMMMMM    MMM  MMMMM MMM  MMM    MM"; 
echo -e "\033[1;31m       \$";
echo -e "\033[1;33m                       Willkommen auf meinem Raspberry Pi! \033[0m";
echo -e "=========================================================================================="
echo -e "\033[1;33m Debian Verson:   	\033[0m" `cat /etc/debian_version`
echo -e "\033[1;33m Kernel Version:  	\033[0m" `uname -a | awk '{print $3}'`
echo -e "\033[1;33m Rasp-Build-Datum:	\033[0m" `more /boot/issue.txt | grep '20' | awk '{print $4}'`
echo -e "=========================================================================================="
echo -e "\033[1;33m Systemzeit:     	\033[0m" `date | awk '{print $4}'` "Uhr"
echo -e "\033[1;33m Online seit:    	\033[0m" `uptime | awk '{print $3}'` "Stunden"
echo -e "=========================================================================================="
echo -e "\033[1;33m Speichernutzung:	\033[0m" `cat /proc/meminfo|grep 'MemF'| awk '{print $2/1000}'` "MB von" `cat /proc/meminfo|grep 'MemT'| awk '{print $2/1000}'` "MB frei"
echo -e "\033[1;33m CPU-Takt:       	\033[0m" `sudo cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq | awk '{print $1/1000}'` "MHz"
echo -e "\033[1;33m CPU-Temperatur: 	\033[0m" `cat /sys/class/thermal/thermal_zone0/temp | awk '{printf("%.1f\n", $1/1000)}'` "°C"
echo -e "=========================================================================================="
echo -e "\033[1;33m User     Anschluss     Seit              von\033[0m"
/usr/bin/who
echo -e "==========================================================================================";
