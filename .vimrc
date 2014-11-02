set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin '1995eaton/vim-better-css-completion', { 'for' : 'css' }
Plugin '1995eaton/vim-better-javascript-completion', { 'for' : 'javascript' }
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'Chiel92/vim-autoformat'
Plugin 'docunext/closetag.vim'
Plugin 'godlygeek/tabular'
Plugin 'elzr/vim-json'
Plugin 'flazz/vim-colorschemes'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'mattn/emmet-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
Plugin 'Raimondi/delimitMate'
" Plugin 'skammer/vim-css-color'
Plugin 'scrooloose/nerdtree'
" Plugin 'scrooloose/syntastic'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/php.vim', { 'for' : 'php' }

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" basic settings
syntax on               " eternal syntax highlighting
set nu                  " dem line numbahs
set showtabline=2       " always want that tab bar
set visualbell          " stop that obnoxious warning bell
set nowrap              " screw that word wrap crap
set scrolloff=999       " keep me vertically at the center of the screen
set sidescrolloff=999   " keep me horizontally at the center of the screen
set cursorline          " where am I?

" autocompletion
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags    " force Vim to autocomplete my HTML tags

" force vim to delete a file's buffer upon closing -- I switch around git
" branches a lot, so this has become a severe problem
autocmd BufEnter * setlocal bufhidden=delete

" copying && pasting fixes -- attempting to hook into the system clipboard
map <F2> :w !pbcopy<CR><CR>                 " sets F2 to copy to the system clipboard w/out cutting everything
map <F3> :r !pbpaste<CR>:set nopaste<CR>    " sets F3 to paste from the system clipboard -- with the added bonus of no autoindent madness

" color settings
colorscheme bvemu       " gawjus
set t_Co=256            " 256 color mode engage

" indentation fixes
set shiftwidth=4        " actually have no idea what all these do?
set softtabstop=4       " but it's important stuff
set smarttab            " namely, setting the tab widths to all be 4 spaces
set expandtab

" fix other people's janky tabbing in a jiffy
nmap \t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>

" quickly set wrapping
nmap \w :setlocal wrap!<CR>:setlocal wrap?<CR>

" linewise moving fixes -- for wrapped text
nmap j gj  " when you move up and down through wrapped text, it will now
nmap k gk  " move down WITHIN lines

" searching upgrades
set incsearch              " highlights as you type an expression
set ignorecase             " makes search case-insensitive, except...
set smartcase              " ...when you type an uppercase character
set hlsearch               " highlight all search results
nmap \q :nohlsearch<CR>    " bind no highlighting to the \e cmd

" NERDTree upgrade -- two-character invocation
nmap \e :NERDTreeToggle<CR>

" CloseTag loading only on html/xhtml
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

" airline
let g:airline_powerline_fonts=1                 " bring on the pretty
set laststatus=2                                " always want that statusbar
let g:airline#extensions#tabline#enabled=1      " major tabline upgrade
let g:airline_section_y = '%{strftime("%c")}'   " show the time in the statusbar
let g:airline_theme='wombat'                    " much better than the original theme

