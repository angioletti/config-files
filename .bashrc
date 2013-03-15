#
# ~/.bashrc
#

HISTSIZE=10000
HISTFILESIZE=20000

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Colored Prompt

if [ $UID != 0 ]; then
	PS1='[\[\033[0;32m\]\u\[\033[0m\]\[\033[0;34m\]@\[\033[0m\]\[\033[0;36m\]\h \[\033[0m\]\W]\$ '
else 
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
fi

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

#TMUX
# tests if tmux is installed
if which tmux 2>&1 >/dev/null; then
    #if no session is running, start a new one
    test -z ${TMUX} && tmux
    
    #when quitting tmux, try to reattach
    while test -z ${TMUX}; do
        tmux attach || break
    done
fi
