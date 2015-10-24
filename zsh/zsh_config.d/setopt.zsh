# basic
setopt no_beep

#changing directories
setopt auto_cd
setopt pushd_ignore_dups

# history
setopt append_history
setopt extended_history
setopt inc_append_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt hist_verify
setopt share_history

# completion
setopt auto_name_dirs

# misc.
setopt nullglob
unset MAILCHECK
unsetopt nomatch

stty eof ''
