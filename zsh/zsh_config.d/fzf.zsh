# INITIALIZATION
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/opt/fzf/bin"
fi

if [[ ! "$MANPATH" == */usr/local/opt/fzf/man* && -d "/usr/local/opt/fzf/man" ]]; then
  export MANPATH="$MANPATH:/usr/local/opt/fzf/man"
fi

[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

source "/usr/local/opt/fzf/shell/key-bindings.zsh"

# GENERAL
export FZF_DEFAULT_COMMAND='ag -l -g ""'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_DEFAULT_OPTS='
--bind ctrl-f:page-down,ctrl-b:page-up
--ansi
--color fg:-1,bg:-1,hl:160,fg+:234,bg+:247,hl+:234
--color info:-1,prompt:254,spinner:160,pointer:234,marker:247
'

# KEY BINDINGS
bindkey '^P' fzf-file-widget
bindkey '^Y' fzf-history-widget

# HELPER FUNCTIONS
# open matched file in editor of choice
fe() {
  local file
  file=$(fzf-tmux --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && ${EDITOR:-vim} "$file"
}

# fk - kill process
fk() {
  pid=$(ps -ef | sed 1d | fzf-tmux -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    kill -${1:-9} $pid
  fi
}

# select selected tmux session
fts() {
  local session
  session=$(tmux list-sessions -F "#{session_name}" | fzf-tmux --query="$1" --select-1 --exit-0) &&
  tmux switch-client -t "$session"
}

# checkout local/remote git branch
fbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" | fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# easier git stash management
fstash() {
  local out q k sha
  while out=$(
    git stash list --pretty="%C(yellow)%h %>(14)%Cgreen%cr %C(blue)%gs" |
    fzf-tmux --ansi --no-sort --query="$q" --print-query --expect=ctrl-d,ctrl-b);
  do
    q=$(head -1 <<< "$out")
    k=$(head -2 <<< "$out" | tail -1)
    sha=$(tail -1 <<< "$out" | cut -d' ' -f1)
    [ -z "$sha" ] && continue
    if [ "$k" = 'ctrl-d' ]; then
      git diff $sha
    elif [ "$k" = 'ctrl-b' ]; then
      git stash branch "stash-$sha" $sha
      break;
    else
      git stash show -p $sha
    fi
  done
}
