export FZF_DEFAULT_COMMAND=' (git ls-tree -r --name-only HEAD || ag -l -g "") 2> /dev/null'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_DEFAULT_OPTS='
--bind ctrl-f:page-down,ctrl-b:page-up
--ansi
--color fg:-1,bg:-1,hl:160,fg+:234,bg+:247,hl+:234
--color info:-1,prompt:254,spinner:160,pointer:234,marker:247
'

bindkey '^P' fzf-file-widget
bindkey '^H' fzf-history-widget
bindkey '^D' fzf-cd-widget

# HELPER FUNCTIONS
# open matched file in editor of choice
fe() {
  local file
  file=$(fzf-tmux --query="$1" --select-1 --exit-0)
  [ -n "$file" ] && ${EDITOR:-vim} "$file"
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
