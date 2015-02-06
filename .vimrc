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
" Plugin 'ap/vim-buftabline'
Plugin 'bling/vim-airline'
Plugin 'Chiel92/vim-autoformat'
Plugin 'docunext/closetag.vim'
Plugin 'godlygeek/tabular'
Plugin 'elzr/vim-json'
" Plugin 'flazz/vim-colorschemes'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'kchmck/vim-coffee-script'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'mattn/emmet-vim'
Plugin 'morhetz/gruvbox'
Plugin 'msanders/snipmate.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'Shougo/unite.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-haml'
Plugin 'vim-scripts/matchit.zip.git'
Plugin 'vim-scripts/Obvious-Mode'
Plugin 'vim-scripts/php.vim', { 'for' : 'php' }

" various calls
call vundle#end()            " required
filetype plugin indent on    " required

" === BASIC SETTINGS === "
" various settings
syntax on                       " eternal syntax highlighting
set nu                          " dem line numbahs
set showtabline=2               " always want that tab bar
set visualbell                  " stop that obnoxious warning bell
set wrap                        " I am a fan of word wrap
set scrolloff=5                 " keep me vertically at the center of the screen
set sidescrolloff=5             " keep me horizontally at the center of the screen
set cursorline                  " where am I?
set backspace=indent,eol,start  " better backspacing
set hidden                      " hidden buffers
set linebreak                   " preserve words when breaking
filetype plugin on              " required
set autoread                    " change a file instantly when it's changed outside
set noswapfile                  " no more .swp files
set cmdheight=2                 " fits Press Enter to Continue
set lazyredraw                  " don't redraw in macros
set nostartofline               " don't jump to first character when paging
set noshowmode                  " I already know what mode we're in thx to airline
set foldmethod=manual           " don't auto fold things

" show ↪ at the beginning of wrapped lines
if has("linebreak")
    let &sbr = nr2char(8618).' '
endif

" color settings
colorscheme gruvbox       " gawjus
set t_Co=256                " 256 color mode engage
set background=dark

" indentation settings
set shiftwidth=4        " tab = 4 spaces
set softtabstop=4       " tab = 4 spaces
set smarttab            " be smart about tabs
set expandtab           " spaces, not tabs
filetype plugin indent on

" Ruby/Coffeescript/Scss/Haml indentation settings
au FileType ruby setl sw=2 sts=2
au FileType coffee setl sw=2 sts=2
au FileType scss setl sw=2 sts=2
au FileType haml setl sw=2 sts=2

" searching settings
set incsearch              " highlights as you type an expression
set ignorecase             " makes search case-insensitive, except...
set smartcase              " ...when you type an uppercase character
set hlsearch               " highlight all search results

" command-line completion settings
set wildmode=list:longest,full

" open to same spot in file when reopening
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
" remember info about open buffers on close
set viminfo^=%

 " === TABLINE === "
" " colors -- make it purdy
" hi TabLineSel ctermfg=255 ctermbg=33
" hi TabLineFill ctermbg=236
" hi TabLine ctermfg=247 ctermbg=240
"
 " === STATUSLINE === "
" " make it appear
set laststatus=2
"
" " create it
" set statusline=%1*\ %{Mode()}\ %0*        " what's the haps
" set statusline+=%2*\ %0*
" set statusline+=%4*[%n]              " buffer no.
" set statusline+=%3*\ \ %0*
" set statusline+=%5*\ \ %{fugitive#statusline()}
" set statusline+=%3*\ \ %0*
" set statusline+=%5*%f%m              " full filename
" set statusline+=%3*\ \ %0*
" set statusline+=%5*%y                " filetype
"
" set statusline+=%=                  " splits left/right
"
" set statusline+=%3*\ %0*
" set statusline+=%5*Cols:\ %-4c         " column counter
" set statusline+=%3*\ %0*
" set statusline+=%5*Lines:\ %l/%-4L     " lines of total lines
" set statusline+=%3*\ %0*
" set statusline+=%5*Percent:\ %-4P      " percent through doc
"
" " make it work
" function! Mode()
"     redraw
"     let l:mode = mode()
"
"     if     mode ==# \"n"  | exec 'hi User1 ctermfg=255 ctermbg=33 | hi User2 ctermfg=33 ctermbg=236'    | return \"NORMAL"
"     elseif mode ==# \"i"  | exec 'hi User1 ctermfg=255 ctermbg=40 | hi User2 ctermfg=40 ctermbg=236'  | return \"INSERT"
"     elseif mode ==# \"r"  | exec 'hi User1 ctermfg=255 ctermbg=196 | hi User2 ctermfg=196 ctermbg=236'| return \"REPLACE"
"     elseif mode ==# \"R"  | exec 'hi User1 ctermfg=255 ctermbg=196 | hi User2 ctermfg=196 ctermbg=236'| return \"REPLACE"
"     elseif mode ==# \"v"  | exec 'hi User1 ctermfg=255 ctermbg=208 | hi User2 ctermfg=208 ctermbg=236'   | return \"VISUAL"
"     elseif mode ==# \"V"  | exec 'hi User1 ctermfg=255 ctermbg=208 | hi User2 ctermfg=208 ctermbg=236'   | return \"V-LINE"
"     else                 | return l:mode
"     endif
" endfunc
"
" " style it 
" hi User3 ctermfg=255 ctermbg=236
" hi User4 ctermfg=255 ctermbg=236
" hi User5 ctermfg=255 ctermbg=236

" === PLUGIN SETTINGS === "
" colorscheme setting
if !has("gui_running")
   let g:gruvbox_italic=0
endif

" vim-markdown settings
let g:vim_markdown_folding_disabled=1

" nerdtree settings
let NERDTreeShowHidden=1

" closetag settings
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

" vim-indent-guides settings
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=238
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=239

" airline settings
let g:airline_powerline_fonts=1
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme="gruvbox"
let g:airline#extensions#tabline#formatter = 'unique_tail'

" === MAPPINGS === "
" mapleader -- v important
let mapleader = ","
let g:mapleader = ","

" copying && pasting mappings
map <F2> :w !pbcopy<CR><CR>
map <F3> :r !pbpaste<CR>:set nopaste<CR>

" tabfix mapping
nmap <leader>t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>

" wrap mapping
nmap <leader>w :setlocal wrap!<CR>:setlocal wrap?<CR>

" kill search hl mapping
nmap <leader>q :nohlsearch<CR>

" NERDTree mapping
nmap <leader>e :NERDTreeToggle<CR>

" Wipeout() mapping
nmap <leader>x :call Wipeout()<CR>

" buffer-switching mapping
nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> <S-Tab> :bp<CR>

" linewise moving mapping
nnoremap j gj
nnoremap k gk

" Esc remapping
inoremap <leader>i <Esc>

" common Tabularize mappings
nnoremap <leader>= :Tabularize /=<CR>
nnoremap <leader>: :Tabularize /:<CR>

" Unite buffer list mapping
nmap <leader>v :Unite buffer<CR>

" function autocomplete mapping
inoremap {<cr> {<cr>}<c-o>O<tab>
inoremap [<cr> [<cr>]<c-o>O<tab>
inoremap (<cr> (<cr>)<c-o>O<tab>

" remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" close buffer but not window
map <leader>bw :bp<bar>sp<bar>bn<bar>bd<CR>

" arrow keys to switch between windows
nmap <Right> <c-w>l
nmap <Left> <c-w>h
nmap <Up> <c-w>k
nmap <Down> <c-w>j

" fixing :WQA derpage
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))
cnoreabbrev <expr> Wqa ((getcmdtype() is# ':' && getcmdline() is# 'Wqa')?('wqa'):('Wqa'))
cnoreabbrev <expr> Bw ((getcmdtype() is# ':' && getcmdline() is# 'Bw')?('bw'):('Bw'))

" === FUNCTIONS === "
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
