# git
alias g="git"
alias gs="git status"
alias ga="git add"
alias gc="git commit -vam"
alias gp="git push"
alias gup="git pull --rebase"
alias gco="git checkout"
alias grh="git reset --hard HEAD"

# ruby
alias pkr="pkill ruby"

# rails
alias bi="bundle install"

alias sp="spork &"
alias at="autotest"

alias spa="spork cucumber & spork"
alias ata="AUTOFEATURE=true autotest"

alias dbm="rake db:migrate"
alias dbr="rake db:reset && rake db:test:prepare"
alias dbrb="rake db:drop && rake db:create && rake db:migrate && rake db:seed && rake db:test:prepare"
