cdpath=(. $HOME/Documents/code $HOME/Documents/code/go/src $HOME/newrelic)

current() {
  if [[ -f $CURRENT_PROJECT_PATH ]]; then
    cd "$(cat $CURRENT_PROJECT_PATH)"
  fi
}

current
