export FZF_DEFAULT_COMMAND='ag -l -g ""'

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
