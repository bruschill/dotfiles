"==> SETTINGS
    filetype plugin on 
    filetype indent on 
    syntax region regionFold start="//region" end="//endregion" transparent fold keepend      
    syntax enable                       

    set t_co=256

    colors molokai                       " Set the name of the default colorscheme file

    set go-=m
    set go-=T
    set go-=r

    set nocompatible                    " Turn of vi compatibility (required by project plugin)
    set backup                          " Create a backup file when overwriting an existing file.
    set backupdir=~/.vim/.tmp
    set writeany                        " Allow saving to any file
    set autoread                        " Automatically read in file currently being edited if it has changed
    set confirm                         " Instead of failing a command because of unsaved changes, instead raise a dialogue asking if you wish to save changed files.
    set hidden                          " Allows switching between buffers without having to save.  Also, allows for undo buffers on multiple files
    set foldmethod=syntax               " Set folding method to determine folds by using language syntax file
    set browsedir=current               " Set the directory for which the file browser should start in when being opened
    set complete+=k                     " Scan the files given with the 'dictionary' option
    set showcmd                         " Show (partial) command in the last line of the screen.
    set wildmenu                        " When 'wildmenu' is on, command-line completion operates in an enhanced mode. command-line completion in an enhanced mode 
    set nowrap                          " Turn of the line wrapping of lines longer than the width of the window do not wrap lines 
    set hlsearch                        " Highlight all matches of most recent search pattern.  Use :nohlsearch to remove highlighting
    set incsearch                       " Increasingly search, updating after each letter is typed
    set showmatch                       " When ) or } is entered, cursor moves briefly to matching ( or {.  If no match, rings the error message bell.  Very useful for programming
    set number                          " Display line number on left
    set backspace=indent,eol,start      " Allow backspacing over autoindent, line breaks and start of insert action
    set tabstop=4                       " Define number of spaces a tab indents during editing session
    set shiftwidth=4				    " Define number of spaces used when the indent is increased or decreased
    set expandtab                       " Expand all tabs to their equivalent representation using spaces
    set smarttab                        " 

"key mappings
    nnoremap    <silent> <C-S-n>            :bn<CR>
    nnoremap    <silent> <C-S-p>            :bp<CR>
    nnoremap    <silent> <C-S-c>            :bd<CR>
    inoremap    <silent> <C-Space>          <C-X><C-O>

    nmap        <silent> <Leader>vr         :so $MYVIMRC<CR>
    nmap        <silent> <Leader>ve         :e $MYVIMRC<CR>

"autocomplpop
    let g:acp_behaviorkeywordlength=2
    let g:acp_behaviorperlomnilength=0


"omnicppcomplete
    let OmniCpp_NamespaceSearch = 2
    let OmniCpp_ShowPrototypeInAbbr = 1
    let OmniCpp_SelectFirstItem = 2
    let OmniCpp_DefaultNamespaces = ["string", "std"]
    let OmniCpp_MayCompleteScope = 1
