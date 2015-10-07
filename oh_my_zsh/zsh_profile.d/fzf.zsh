export FZF_DEFAULT_OPTS='
--extended
--bind ctrl-f:page-down,ctrl-b:page-up
--color fg:-1,bg:-1,hl:166,fg+:234,bg+:247,hl+:234
--color info:-1,prompt:254,spinner:166,pointer:234,marker:247
'

bindkey '^P' fzf-file-widget
bindkey '^F' fzf-history-widget
