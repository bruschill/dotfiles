let g:ctrlp_map = ''
let g:ctrlp_custom_ignore = {
\ 'dir':  '\.git$\|\.hg$\|\.svn$',
\ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
\ }

if has("gui_macvim")
  macmenu &File.New\ Tab key=<D-S-t>
  if has("gui_running")
    map <D-t> :CtrlP<CR>
    imap <D-t> <ESC>:CtrlP<CR>
  endif
endif
