" turning filetype stuff on
filetype on
filetype plugin on
filetype indent on

" turning syntax highlighting on
syntax on

" remove menu bar
set go-=m

" remove the tab bar (?)
set go-=T

" remove right scrollbar
set go-=r

color molokai

" turn off the fscking audible and visual bell
set t_vb=

" turn of vi compatibility.
set nocompatible

" turn off line wrapping.
set nowrap

" create a backup file when overwriting an existing file.
set backup

" set backup dir to hidden temp dir in the vim dir so current dir isn't pollluted with the backups.
set backupdir=$HOME/.vim/.tmp/

" allow saving to any file.
set writeany

" automatically read in file currently being edited if it has changed.
set autoread

" raise dialogue prompting to save unsaved changes, rather than throwing an error.
set confirm

" allow switching between buffers without having to save.
set hidden

" set folding method to determine folds by using language syntax file.
set foldmethod=syntax

" setting browsedir.
set browsedir=current

" highlight all matches of most recent search pattern.
set hlsearch

" search incrementally, updating after each letter is typed.
set incsearch

" when ( or { is entered, cursor moves briefly to matching ) or }.
set showmatch

" length in seconds of which matching brace is highlighted.
set matchtime=3

" show line numbers.
set number

" expand all tabs to their equivalent representation using spaces.
set expandtab

" backspacing over a tab removes correct number of spaces defined by expandtab
set smarttab
set backspace=indent,eol,start

" setting enhanced command line completion
set wildmenu

" setting buffer switching/closing mappings
nnoremap    <silent> <C-S-n>            :bn<CR>
nnoremap    <silent> <C-S-p>            :bp<CR>
nnoremap    <silent> <C-S-c>            :Bclose<CR>

" gvimrc edit/reload mappings
nmap  <silent> <Leader>ve  :e ~/.gvimrc.local<CR>
nmap  <silent> <Leader>vr  :so ~/.gvimrc.local<CR>

" cd to the directory containing the file in the buffer
nmap  <silent> <Leader>cd  :lcd %:h<CR>
