" VIMRC "
" by Andy McGuinness "

" === PATHOGEN === "
" basic settings "
execute pathogen#infect()
set nocompatible
filetype plugin indent on

" === BASIC SETTINGS === "
" various settings "
syntax on                       " eternal syntax highlighting "
set nu                          " dem line numbahs "
set showtabline=2               " always want that tab bar "
set visualbell                  " stop that obnoxious warning bell "
set wrap                        " I am a fan of word wrap "
set scrolloff=5                 " keep me vertically at the center of the screen "
set sidescrolloff=5             " keep me horizontally at the center of the screen "
set cursorline                  " where am I? "
set backspace=indent,eol,start  " better backspacing "
set hidden                      " hidden buffers "
set linebreak                   " preserve words when breaking "
filetype plugin on              " required "
set autoread                    " change a file instantly when it's changed outside "
set noswapfile                  " no more .swp files "
set cmdheight=2                 " fits Press Enter to Continue "
set lazyredraw                  " don't redraw in macros "
set nostartofline               " don't jump to first character when paging "
set noshowmode                  " I already know what mode we're in thx to airline "
set foldmethod=manual           " don't auto fold things "
set laststatus=2                " show the statusline "

" show ↪ at the beginning of wrapped lines "
if has("linebreak")
    let &sbr = nr2char(8618).' '
endif

" color settings "
set t_Co=256
set termguicolors
set background=dark
colo seoul256
hi clear SignColumn

" indentation settings "
set shiftwidth=2        " tab = 2 spaces "
set softtabstop=2       " tab = 2 spaces "
set smarttab            " be smart about tabs "
set expandtab           " spaces, not tabs "
filetype plugin indent on

" Ruby/Coffeescript/Scss/Haml indentation settings "
au FileType php setl sw=4 sts=4

" set .ejs files to be read like html "
au BufNewFile,BufRead *.ejs set filetype=html

" searching settings "
set incsearch              " highlights as you type an expression "
set ignorecase             " makes search case-insensitive, except... "
set smartcase              " ...when you type an uppercase character "
set hlsearch               " highlight all search results "

" command-line completion settings "
set wildmode=list:longest,full

" open to same spot in file when reopening "
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
" remember info about open buffers on close "
set viminfo^=%

" make 0 go to the beginning of the line "
map 0 ^

" === PLUGIN SETTINGS === "
" colorscheme setting "
if !has("gui_running")
   let g:gruvbox_italic=0
endif

" vim-markdown settings "
let g:vim_markdown_folding_disabled=1

" nerdtree settings "
let NERDTreeShowHidden=1

" closetag settings "
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1

" vim-indent-guides settings "
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=237

" delimitmate settings "
 au FileType html let b:delimitMate_matchpairs = "(:),[:],{:}"

" airline settings "
let g:airline_powerline_fonts=1
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#formatter = 'unique_tail'

" tagbar settings "
let g:tagbar_type_css = {
\ 'ctagstype' : 'Css',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
\ }
let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : '/path/to/markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }
let g:tagbar_phpctags_bin='~/.vim/bundle/tagbar-phpctags/bin'
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }
let g:tagbar_type_javascript = {
    \ 'ctagsbin' : '/usr/local/bin/jsctags'
\ }

" vim notes settings "
let g:notes_directories = ['~/Dropbox/Notes']


" === MAPPINGS === "
" mapleader -- v important "
let mapleader = ","
let g:mapleader = ","
let maplocalleader = ","
let g:maplocalleader = ","

" copying && pasting mappings "
map <F2> :w !pbcopy<CR><CR>
map <F3> :r !pbpaste<CR>:set nopaste<CR>

" tabfix mapping "
nmap <leader>t :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>

" wrap mapping "
nmap <leader>w :setlocal wrap!<CR>:setlocal wrap?<CR>

" kill search hl mapping "
nmap <leader>q :nohlsearch<CR>

" NERDTree mapping "
nmap <leader>e :NERDTreeToggle<CR>

" Wipeout() mapping "
nmap <leader>W :call Wipeout()<CR>

" buffer-switching mapping "
nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> <S-Tab> :bp<CR>

" linewise moving mapping "
nnoremap j gj
nnoremap k gk

" Esc remapping "
inoremap <leader>i <Esc>

" common Tabularize mappings "
nnoremap <leader>= :Tabularize /=<CR>
nnoremap <leader>: :Tabularize /:<CR>

" Unite buffer list mapping "
nmap <leader>v :Unite buffer<CR>

" function autocomplete mapping "
inoremap {<cr> {<cr>}<c-o>O
inoremap [<cr> [<cr>]<c-o>O
inoremap (<cr> (<cr>)<c-o>O

" remove the Windows ^M - when the encodings gets messed up "
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" close buffer but not window "
map <leader>bw :bp<bar>sp<bar>bn<bar>bd<CR>

" arrow keys to switch between windows "
nmap <Right> <c-w>l
nmap <Left> <c-w>h
nmap <Up> <c-w>k
nmap <Down> <c-w>j

" fixing :WQA derpage "
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))
cnoreabbrev <expr> Wqa ((getcmdtype() is# ':' && getcmdline() is# 'Wqa')?('wqa'):('Wqa'))
cnoreabbrev <expr> Bw ((getcmdtype() is# ':' && getcmdline() is# 'Bw')?('bw'):('Bw'))

" mapping undo to ctrl-z "
nmap <C-z> u<cr>

" mapping silver searcher "
nmap <leader>/ :Ag 

" tagbar mapping "
nmap <F8> :TagbarToggle<CR>


" === FUNCTIONS === "
" function to delete all hidden buffers "
function! Wipeout()
    " list of *all* buffer numbers "
    let l:buffers = range(1, bufnr('$'))

    " what tab page are we in? "
    let l:currentTab = tabpagenr()
    try
        " go through all tab pages "
        let l:tab = 0
        while l:tab < tabpagenr('$')
            let l:tab += 1

            " go through all windows "
            let l:win = 0
            while l:win < winnr('$')
                let l:win += 1
                " whatever buffer is in this window in this tab, remove it from "
                " l:buffers list "
                let l:thisbuf = winbufnr(l:win)
                call remove(l:buffers, index(l:buffers, l:thisbuf))
            endwhile
        endwhile

        " if there are any buffers left, delete them "
        if len(l:buffers)
            execute 'bwipeout' join(l:buffers)
        endif
    finally
        " go back to our original tab page "
        execute 'tabnext' l:currentTab
    endtry
endfunction
