NONE="\[\033[0m\]"
BK="\[\033[0;30m\]" #Black
EBK="\[\033[1;30m\]"
RD="\[\033[0;31m\]" #Red
ERD="\[\033[1;31m\]"
GR="\[\033[0;32m\]" #Green
EGR="\[\033[1;32m\]"
YW="\[\033[0;33m\]" #Yellow
EYW="\[\033[1;33m\]"
BL="\[\033[0;34m\]" #Blue
EBL="\[\033[1;34m\]"
MG="\[\033[0;35m\]" #Magenta
EMG="\[\033[1;35m\]"
CY="\[\033[0;36m\]" #Cyan
ECY="\[\033[1;36m\]"
WH="\[\033[0;37m\]" #White
EWH="\[\033[1;37m\]"

# BASH/SUDO COMPLETION
. /etc/bash_completion
complete -cf sudo

# SET PATH
[[ -d $HOME/.bin ]] && export PATH=$HOME/.bin:$PATH
export PATH=/usr/share/perl5/vendor_perl/auto/share/dist/Cope:$PATH

# MISC OPTIONS
eval `dircolors -b`
export EDITOR=vim
export HISTCONTROL=ignoredups
export HISTSIZE=5000
export HISTFILESIZE=1000
export HISTIGNORE='ls:pwd:exit:clear'
shopt -s cdable_vars
shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s extglob
set -o noclobber
stty -ctlecho

# PROMPT
PS1="[${GR}\u@\h${BL} \W${NONE}]$ "

