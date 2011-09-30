# ZSH CONFIG #
# path to oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# zsh theme
ZSH_THEME="miloshadzic"

# sourcing the zsh shell script
source $ZSH/oh-my-zsh.sh

setopt auto_cd
cdpath=($HOME/Documents/code)

#loading aliases
if [ -f ~/.bash_aliases ]; then
 . ~/.bash_aliases
fi

# PATHING
# homebrew
export PATH=/usr/local/bin:$PATH

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
