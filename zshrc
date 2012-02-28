# path to oh-my-zsh home and history directories
export PATH=/usr/local/bin:$PATH
export ZSH=$HOME/.oh-my-zsh
export ZSH_HISTORY_PATH=$HOME/.zsh_history

unset MAILCHECK

# setting the theme
ZSH_THEME="miloshadzic"

# plugins
plugins=(brew bundler vi-mode)

# sourcing the zsh shell script
source $ZSH/oh-my-zsh.sh

for zsh_source in $HOME/.zsh_profile.d/*.zsh; do
  source $zsh_source
done

source $HOME/.aliasrc
source $HOME/.zsh_profile.d/rvm

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
