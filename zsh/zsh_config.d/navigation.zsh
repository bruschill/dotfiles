cdpath=(. $HOME/Documents/code $HOME/Documents/code/go/src/github.com/bruschill)

current() {
  if [[ -f $CURRENT_PROJECT_PATH ]]; then
    cd "$(cat $CURRENT_PROJECT_PATH)"
  fi
}

current
