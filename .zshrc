export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# terminal color theming
PS1='\[\033[31m\]\u\[\033[33m\]@\h\[\033[32m\] \w \[\033[37m\]'
unset color_prompt force_color_prompt

# neovim alias
alias vim='nvim'

# common mistakes
alias gti='git'
alias got='git'
alias tree='tree -I node_modules'

# set vim as default editor
export VISUAL=nvim
export EDITOR="$VISUAL"

# vi mode on terminal
set -o vi


export EDITOR=vim
