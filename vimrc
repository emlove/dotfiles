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

Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'

Plugin 'AndrewRadev/sideways.vim'

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

" Auto indent
set autoindent

" Use smart case for text searches
set ignorecase
set smartcase

" Show relative line numbers
set number
set relativenumber

set background=dark

set hidden

let g:session_autosave = 'yes'
let g:session_autoload = 'yes'

" Map Ctrl-C to Esc
vnoremap <C-c> <Esc>
nnoremap <C-c> <Esc>
inoremap <C-c> <Esc>

" Disable mouse
set mouse-=a
"
" Buffer navigation
map gn :bn<cr>
map gp :bp<cr>
map gN :bp<cr>

nnoremap <c-h> :SidewaysLeft<cr>
nnoremap <c-l> :SidewaysRight<cr>
