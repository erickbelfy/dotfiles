# Source git prompt
source ~/.git-prompt.sh

# terminal color theming
#PS1='\[\033[31m\]\u\[\033[33m\]@\h\[\033[32m\] \w \[\033[37m\]'
unset color_prompt force_color_prompt

# configure some useful paths
PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH

# set macvim for use on terminal
alias vim='mvim -v'

# set vim as default editor
export VISUAL=vim
export EDITOR="$VISUAL"

# vi mode on terminal
set -o vi

# Trigger ~/.bashrc commands
source ~/.bashrc