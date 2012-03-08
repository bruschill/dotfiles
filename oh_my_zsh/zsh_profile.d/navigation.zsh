setopt auto_cd
cdpath=(. $HOME/Documents/code)

current() {
  if [[ -f $CURRENT_PROJECT_PATH ]]; then
    cd "$(cat $CURRENT_PROJECT_PATH)"
  fi
}

current
