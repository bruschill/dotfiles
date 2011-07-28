filetype plugin on

syntax on

set go-=m
set go-=T
set go-=r

color molokai

set novb
set nocompatible
set nowrap
set backup                          " Create a backup file when overwriting an existing file.
set backupdir=~/.vim/.tmp
set writeany                        " Allow saving to any file
set autoread                        " Automatically read in file currently being edited if it has changed
set confirm                         " Instead of failing a command because of unsaved changes, instead raise a dialogue asking if you wish to save changed files.
set hidden                          " Allows switching between buffers without having to save.  Also, allows for undo buffers on multiple files
set foldmethod=syntax               " Set folding method to determine folds by using language syntax file
set browsedir=current 
set hlsearch                        " Highlight all matches of most recent search pattern.  Use :nohlsearch to remove highlighting
set incsearch                       " Increasingly search, updating after each letter is typed
set showmatch                       " When ) or } is entered, cursor moves briefly to matching ( or {.  If no match, rings the error message bell.  Very useful for programming
set matchtime=3
set number
set expandtab                       " Expand all tabs to their equivalent representation using spaces
set smarttab                        " 
set backspace=indent,eol,start

"key mappings
nnoremap    <silent> <C-S-n>            :bn<CR>
nnoremap    <silent> <C-S-p>            :bp<CR>
nnoremap    <silent> <C-S-c>            :Bclose<CR>
inoremap    <silent> <C-Space>          <C-X><C-O>

nmap        <silent> <Leader>t          :TlistToggle<CR>
nmap        <silent> <Leader>n          :NERDTreeToggle<CR>
nmap        <silent> <Leader>vr         :so ~/.gvimrc<CR>
nmap        <silent> <Leader>ve         :e ~/.gvimrc<CR>

"""PLUGINS"""
"snipMate
"vim-ruby
"rails.vim
"syntastic
"coffee
"cucumber
"git
"haml
"jslint
"sass
"ack
"bclose
"gist
"supertab
"surround
"syntastic
"taglist
"vim-rspec
"yaml
"snippet
