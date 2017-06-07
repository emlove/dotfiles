set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='luna'

Plugin 'flazz/vim-colorschemes'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

call vundle#end()
filetype plugin indent on

colorscheme luna

" Expand tabs into spaces
set expandtab

" Use smart tabs
set smarttab

" Tab length = 4 spaces
set shiftwidth=4
set tabstop=4

" Auto indent and smart indent
" set autoindent
" set si : Removed based on http://stackoverflow.com/a/18415867

" Use smart case for text searches
set ignorecase
set smartcase

" Show relative line numbers
set number
set relativenumber

set background=dark

set hidden

" Map Ctrl-C to Esc
vnoremap <C-c> <Esc>
nnoremap <C-c> <Esc>
inoremap <C-c> <Esc>

map gn :bn<cr>
map gp :bp<cr>
map gN :bp<cr>
