" VIMRC
" 
" by Maia McGuinness

" === VUNDLE SETTINGS === "
" basic settings
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" plugins
Plugin '1995eaton/vim-better-css-completion', { 'for' : 'css' }
Plugin '1995eaton/vim-better-javascript-completion', { 'for' : 'javascript' }
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'Chiel92/vim-autoformat'
Plugin 'docunext/closetag.vim'
" Plugin 'fweep/vim-tabber'
Plugin 'godlygeek/tabular'
Plugin 'elzr/vim-json'
Plugin 'flazz/vim-colorschemes'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'kchmck/vim-coffee-script'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'mattn/emmet-vim'
Plugin 'msanders/snipmate.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'Shougo/unite.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-haml'
Plugin 'vim-scripts/php.vim', { 'for' : 'php' }
Plugin 'vim-scripts/matchit.zip.git'

" various calls
call vundle#end()            " required
filetype plugin indent on    " required

" === BASIC SETTINGS === "
" various settings
syntax on                       " eternal syntax highlighting
set nu                          " dem line numbahs
set showtabline=2               " always want that tab bar
set visualbell                  " stop that obnoxious warning bell
set nowrap                      " screw that word wrap crap
set scrolloff=999               " keep me vertically at the center of the screen
set sidescrolloff=999           " keep me horizontally at the center of the screen
set cursorline                  " where am I?
set backspace=indent,eol,start  " better backspacing
set hidden                      " hidden buffers
set linebreak                   " preserve words when breaking
filetype plugin on              " required

" color settings
colorscheme Tomorrow    " gawjus
set t_Co=256            " 256 color mode engage

" indentation settings
set shiftwidth=4        " actually have no idea what all these do?
set softtabstop=4       " but it's important stuff
set smarttab            " namely, setting the tab widths to all be 4 spaces
set expandtab

" searching settings
set incsearch              " highlights as you type an expression
set ignorecase             " makes search case-insensitive, except...
set smartcase              " ...when you type an uppercase character
set hlsearch               " highlight all search results

" command-line completion settings
set wildmode=list:longest,full

" === PLUGIN SETTINGS === "
" nerdtree settings
let NERDTreeShowHidden=1

" airline settings
let g:airline#extensions#tabline#formatter = 'unique_tail'  " fix how files are displayed in tabline
let g:airline#extensions#tabline#enabled = 1                " dat tabline doe
let g:airline_powerline_fonts=1                             " bring on the pretty
set laststatus=2                                            " always want that statusbar
let g:airline_section_y = '%{strftime("%c")}'               " show the time in the statusbar
let g:airline_theme = 'tomorrow'                            " picking the best theme

" tabber settings
" set tabline=%!tabber#TabLine()
" let g:tabber_prompt_for_new_label = 1

" closetag settings
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

" === MAPPINGS === "
" copying && pasting mappings
map <F2> :w !pbcopy<CR><CR>
map <F3> :r !pbpaste<CR>:set nopaste<CR>

" tabfix mapping
nmap \t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>

" wrap mapping
nmap \w :setlocal wrap!<CR>:setlocal wrap?<CR>

" kill search hl mapping
nmap \q :nohlsearch<CR>

" NERDTree mapping
nmap \e :NERDTreeToggle<CR>

" Wipeout() mapping
nmap \x :call Wipeout()<CR>

" buffer-switching mapping
nnoremap <silent> \n :bn<CR>
nnoremap <silent> \b :bp<CR>

" linewise moving mapping
nnoremap j gj
nnoremap k gk

" Tabber mapping
nmap \r :TabberLabel<CR>
nmap \rn :TabberNew<CR>

" disabling the arrow keys mapping
noremap <up> :echo "Nope."<CR>
noremap <down> :echo "Stop that."<CR>
noremap <left> :echo "Try again."<CR>
noremap <right> :echo "Come on now."<CR>

" Esc remapping
inoremap \i <Esc>

" common Tabularize mappings
" nnoremap \= :Tabularize /=<CR>
" nnoremap \: :Tabularize /:<CR>

" Unite buffer list mapping
nmap \v :Unite buffer<CR>

" function autocomplete mapping
inoremap {<cr> {<cr>}<c-o>O<tab>
inoremap [<cr> [<cr>]<c-o>O<tab>
inoremap (<cr> (<cr>)<c-o>O<tab>

" === WIPEOUT() === "
" function to delete all hidden buffers
function! Wipeout()
  " list of *all* buffer numbers
  let l:buffers = range(1, bufnr('$'))

  " what tab page are we in?
  let l:currentTab = tabpagenr()
  try
    " go through all tab pages
    let l:tab = 0
    while l:tab < tabpagenr('$')
      let l:tab += 1

      " go through all windows
      let l:win = 0
      while l:win < winnr('$')
        let l:win += 1
        " whatever buffer is in this window in this tab, remove it from
        " l:buffers list
        let l:thisbuf = winbufnr(l:win)
        call remove(l:buffers, index(l:buffers, l:thisbuf))
      endwhile
    endwhile

    " if there are any buffers left, delete them
    if len(l:buffers)
      execute 'bwipeout' join(l:buffers)
    endif
  finally
    " go back to our original tab page
    execute 'tabnext' l:currentTab
  endtry
endfunction
