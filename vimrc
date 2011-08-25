filetype plugin on
filetype indent on
syntax on

color ir_black

set novb
set nocompatible
set nowrap
set backup                          " Create a backup file when overwriting an existing file.
set writeany                        " Allow saving to any file
set autoread                        " Automatically read in file currently being edited if it has changed
set confirm                         " Instead of failing a command because of unsaved changes, instead raise a dialogue asking if you wish to save changed files.
set hidden                          " Allows switching between buffers without having to save.  Also, allows for undo buffers on multiple files
set foldmethod=syntax               " Set folding method to determine folds by using language syntax file
set browsedir=current 
set showcmd                         " Show (partial) command in the last line of the screen.
set number
set wildmenu                        " When 'wildmenu' is on, command-line completion operates in an enhanced mode. command-line completion in an enhanced mode 
set hlsearch                        " Highlight all matches of most recent search pattern.  Use :nohlsearch to remove highlighting
set incsearch                       " Increasingly search, updating after each letter is typed
set showmatch                       " When ) or } is entered, cursor moves briefly to matching ( or {.  If no match, rings the error message bell.  Very useful for programming
set expandtab                       " Expand all tabs to their equivalent representation using spaces
set smarttab                        " 
set backspace=indent,eol,start

"key mappings
nnoremap    <silent> <C-S-n>            :bn<CR>
nnoremap    <silent> <C-S-p>            :bp<CR>
nnoremap    <silent> <C-S-c>            :Bclose<CR>
inoremap    <silent> <C-Space>          <C-X><C-O>

nmap        <silent> <Leader>vr         :so ~/.vimrc.local<CR>
nmap        <silent> <Leader>ve         :e ~/.vimrc.local<CR>
