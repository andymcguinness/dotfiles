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
Plugin 'fweep/vim-tabber'
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
Plugin 'Shougo/unite.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/php.vim', { 'for' : 'php' }
Plugin 'vim-scripts/matchit.zip.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" basic settings
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
" related, preserve words when breaking
set linebreak

" searching upgrades
set incsearch              " highlights as you type an expression
set ignorecase             " makes search case-insensitive, except...
set smartcase              " ...when you type an uppercase character
set hlsearch               " highlight all search results

" set \q to kill highlighting 
nmap \q :nohlsearch<CR>

" NERDTree upgrade -- two-character invocation
nmap \e :NERDTreeToggle<CR>

" Show hidden files in NERDTree
let NERDTreeShowHidden=1

" CloseTag loading only on html/xhtml
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

" allow matchit
filetype plugin on

" lickety-split tab switching
nmap \g :tabp<CR>       " h (left) key goes to the tab to the left
nmap \l :tabn<CR>       " l (right) key goes to the tab to the right

" killing all other buffers
nmap \x :call Wipeout()<CR>

" lickety-split buffer switching
nnoremap <silent> \n :bn<CR>
nnoremap <silent> \b :bp<CR>

" linewise moving
nnoremap j gj
nnoremap k gk

" airline
let g:airline_powerline_fonts=1                 " bring on the pretty
set laststatus=2                                " always want that statusbar
let g:airline_section_y = '%{strftime("%c")}'   " show the time in the statusbar
let g:airline_theme = 'murmur'                  " picking the best theme

" for Tabber tabline
set tabline=%!tabber#TabLine()
let g:tabber_prompt_for_new_label = 1

" Tabber remapping
nmap \r :TabberLabel<CR>
nmap \rn :TabberNew<CR>

" Stop that. Stop that right now. 
noremap <up> :echo "Nope."<CR>
noremap <down> :echo "Stop that."<CR>
noremap <left> :echo "Try again."<CR>
noremap <right> :echo "Come on now."<CR>

" avoiding Esc
inoremap \i <Esc>

" set up Tabularize to make the pretty
nnoremap \a :Tabularize /=<CR>

" Unite buffer list
nmap \v :Unite buffer<CR>

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
