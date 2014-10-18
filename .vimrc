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
Plugin 'godlygeek/tabular'
Plugin 'elzr/vim-json'
Plugin 'flazz/vim-colorschemes'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
Plugin 'Raimondi/delimitMate'
Plugin 'skammer/vim-css-color'
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
set hidden              " hidden buffers: go
set showtabline=2       " always want that tab bar
set visualbell          " stop that obnoxious warning bell
set nowrap              " screw that word wrap crap
set clipboard=unnamed   " supposed to help copy to Mac, hasn't worked
set scrolloff=999       " keep me at the center of the screen
set cursorline          " where am I?

" autocompletion
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags    " force Vim to autocomplete my HTML tags

" color settings
colorscheme bvemu       " gawjus
" colorscheme jellybeans  " nice and calm
set t_Co=256            " 256 color mode engage

" indentation fixes
set shiftwidth=4        " actually have no idea what all these do?
set softtabstop=4       " but it's important stuff
set smarttab            " namely, setting the tab widths to all be 4 spaces
set expandtab


" airline
let g:airline_powerline_fonts=1                 " bring on the pretty
set laststatus=2                                " always want that statusbar
let g:airline#extensions#tabline#enabled=1      " major tabline upgrade
let g:airline_section_y = '%{strftime("%c")}'   " show the time in the statusbar
let g:airline_theme='wombat'                    " much better than the original theme

