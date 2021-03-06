" VIMRC by Curtis Matz
" Vundle Wrapper {{{
set nocompatible              " be iMproved, required
filetype off                  " required
scriptencoding utf-8
set encoding=utf-8

" set the runtime path to include Vundle and initialize
" work sometimes sets $HOME to my network home drive so force local
if has('win32') || has('win64')
    set rtp+=$USERPROFILE/vimfiles/bundle/Vundle.vim
    call vundle#begin('$USERPROFILE/vimfiles/bundle/')
else
    set rtp+=$HOME/.vim/bundle/Vundle.vim
    call vundle#begin()
endif

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-repeat'
" Plugin 'unite.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/syntastic'

call vundle#end()            " required
filetype plugin indent on    " required
" }}}
" Imports {{{
if has('win32') || has('win64')
    source $VIMRUNTIME/mswin.vim
" elseif has('mac')
"     source $VIMRUNTIME/macmap.vim
endif
" }}}
" Grep {{{
if executable('ag')
    set grepprg=ag\ --vimgrep\ $*
    set grepformat=%f:%l:%c:%m
elseif executable('findstr')
    set grepprg=findstr\ /sn\ $*
    set grepformat=%f:%l:%m
endif
" }}}
" Colors {{{
if has('gui_running')
    let g:solarized_termcolors=256
    let g:solarized_diffmode="high"    "default value is normal
    set background=dark
    colorscheme solarized
    if has('win32') || has('win64')
        set guifont=Consolas:h10:b:cANSI
    endif
else
    colorscheme default
endif
syntax enable
" }}}
" Folding {{{
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
set modelines=1
" }}}
" Backup {{{
set nobackup            " DON'T keep a backup file
set directory=$TEMP//,$TMP//,.
" }}}
" Leader {{{
let mapleader = ";"
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>:noh<CR>
imap jk <esc>
nnoremap , <C-w>
nnoremap ,, <C-w>w
" Shortcut to rapidly toggle `set list`
nnoremap <leader>l :set list!<CR>
" Delete extra white space at end of line
nnoremap <leader>dws :%s/\s\+$<cr>
" Double quote the word
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
" Run python with current file
nnoremap <leader>g :!python %<CR>
" Run cscript with current file
nnoremap <leader>v :!cscript %<CR>
" SQL string formatting
nnoremap <silent> <leader>, :%s/\n/,/g<CR>$x0:noh<CR>
nnoremap <silent> <leader>' :%s/\n/','/g<CR>I'<esc>$xx0:noh<CR>
" }}}
"  Unite Plugin {{{
nnoremap <leader>uf :Unite file<CR>
nnoremap <leader>ub :Unite buffer<CR>
"  }}}
" Vim-Airline Plugin {{{
set laststatus=2   " used in vim_airline
set ttimeoutlen=50 " used in vim airline
" }}}
" Editor {{{
set path+=**
set backspace=indent,eol,start
set ts=4 sts=4 sw=4 expandtab
set number
set relativenumber
set showcmd
set wildmenu
set lazyredraw
set hidden
set mouse=a             " use mouse in xterm to scroll
set completeopt=menu,longest,preview
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,trail:·,eol:¬
" }}}
" Searching {{{
set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
" }}}
"  Diff {{{
" ignore whitespace and end of lines for diff as well as do a veritical diff
set diffopt+=iwhite,vertical
"  }}}
"  Syntastic Plugin {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"  }}}
" Autocmd {{{
if has("autocmd")
  " Enable file type detection
  filetype on

  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  " Customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml

  " SQL language
  autocmd filetype sql setlocal commentstring=--\ %s
  " Auto source vimrc
  " VB Language
  autocmd filetype vb setlocal commentstring='\ %s
endif
" }}}
" vim:foldmethod=marker:foldlevel=0
