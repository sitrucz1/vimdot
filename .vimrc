" VIMRC by Curtis Matz
" Vundle Wrapper {{{
set nocompatible              " be iMproved, required
filetype off                  " required

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
Plugin 'unite.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()            " required
filetype plugin indent on    " required
" }}}
" Imports {{{
" if has('win32') || has('win64')
"     source $VIMRUNTIME/mswin.vim
" elseif has('mac')
"     source $VIMRUNTIME/macmap.vim
" endif
" }}}
" Colors {{{
if has('gui_running')
    let g:solarized_termcolors=256
    set background=dark
    colorscheme solarized
else
    let g:solarized_termcolors=16
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
" Leader {{{
let mapleader = ";"
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
imap jj <esc>
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
" }}}
" NERTTree Plugin {{{
nnoremap <F2> :NERDTreeToggle<CR>
" }}}
" Vim-Airline Plugin {{{
set laststatus=2   " used in vim_airline
set ttimeoutlen=50 " used in vim airline
" }}}
" Editor {{{
set ts=4 sts=4 sw=4 expandtab
set number
set showcmd
set wildmenu
set lazyredraw
set hid
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=eol:¬
" }}}
" Searching {{{
set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase
" }}}
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
endif
" }}}
" vim:foldmethod=marker:foldlevel=0
