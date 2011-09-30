# path to oh-my-zsh home and history directories
export ZSH=$HOME/.oh-my-zsh
export ZSH_HISTORY_PATH=$HOME/.zsh_history

# setting the theme
ZSH_THEME="miloshadzic"

# sourcing the zsh shell script
source $ZSH/oh-my-zsh.sh


for zsh_source in $HOME/.zsh_profile.d/*.zsh; do
  source $zsh_source
done

source $HOME/.aliasrc
source $HOME/.zsh_profile.d/homebrew
source $HOME/.zsh_profile.d/rvm
