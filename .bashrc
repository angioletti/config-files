###########
# VARIABLES
###########
HISTSIZE=10000
HISTFILESIZE=20000

###########
# If not running interactively, don't do anything
###########
[[ $- != *i* ]] && return

###########
# TMUX Config
###########

if [[ -z "$TMUX" ]] ;then
    ID="$( tmux ls | grep -vm1 attached | cut -d: -f1 )" # get the id of a deattached session
    if [[ -z "$ID" ]] ;then # if not available create a new one
        tmux new-session
    else
        tmux attach-session -t "$ID" # if available attach to it
    fi
fi

###########
# Colored Prompt
##########

if [ $UID != 0 ]; then
  PS1='[\[\033[1;32m\]\u\[\033[0m\]\[\033[1;34m\]@\[\033[0m\]\[\033[1;36m\]\h \[\033[0m\]\W]\$ '
else 
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
fi
