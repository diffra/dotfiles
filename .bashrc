# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


case $TERM in
        xterm*|rxvt*)
                TITLEBAR='\[\033]0;\u@\h:\w\007\]'
                ;;
        *)
                TITLEBAR=""
                ;;
esac;
#  Prompt generated by Giles's Prompt-o-matic, 20070529
#  http://www.gilesorr.com/bashprompt/jsb/prompt.html

PS1="${TITLEBAR}\[\033[0m\]\[\033[0;36m\]\t .:{\$(temp=\$(cat /proc/loadavg) && echo \${temp%% *}) \$(temp=\$(cat /proc/uptime) && upSec=\${temp%%.*} ; let secs=\$((\${upSec}%60)) ; let mins=\$((\${upSec}/60%60)) ; let hours=\$((\${upSec}/3600%24)) ; let days=\$((\${upSec}/86400)) ; if [ "\${days}" -ne "0" ]; then echo -n "\${days}d"; fi ; echo -n "\${hours}h\${mins}m")}:. \$(ls -al | grep \"^-\" | wc -l | tr -d \" \") files@\$(ls --si -s | head -1 | awk '{print \$2}')\n\[\033[0m\]\[\033[1;32m\]\u@\h \[\033[0m\]\[\033[0;37m\][\[\033[0m\]\[\033[0;35m\]\w\[\033[0m\]\[\033[0;37m\]] $ \[\033[0;0m\]"

