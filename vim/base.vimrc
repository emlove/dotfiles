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

Plugin 'w0rp/ale'

Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

Plugin 'editorconfig/editorconfig-vim'

Plugin 'prettier/vim-prettier'

Plugin 'norcalli/nvim-colorizer.lua'

Plugin 'kamykn/spelunker.vim'

Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rbenv'
Plugin 'tpope/vim-bundler'

Plugin 'psf/black'

Plugin 'nvim-treesitter/nvim-treesitter'

call vundle#end()
filetype plugin indent on

colorscheme luna

let mapleader = ','

" Expand tabs into spaces
set expandtab

" Use smart tabs
set smarttab

" Faster response time
set lazyredraw

" Tab length = 4 spaces
set shiftwidth=4
set tabstop=4

" Auto indent
set autoindent

" Filetype overrides
autocmd Filetype json setlocal ts=2 sw=2 sts=2
autocmd Filetype html setlocal ts=2 sw=2 sts=2
autocmd Filetype javascript setlocal ts=2 sw=2 sts=2
autocmd Filetype yaml setlocal ts=2 sw=2 sts=2

" Use smart case for text searches
set ignorecase
set smartcase

" Show relative line numbers
set number
set relativenumber

set background=dark

" Allow switching from unsaved buffers
set hidden

set wildmode=longest,list

set tags^=.git/tags;~

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

nnoremap <c-]> :tjump <C-R><C-W><cr>

nnoremap <leader>f :GFiles --recurse-submodules<cr>

" yank to clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

let g:ale_sign_column_always = 1

let g:ale_linters = {
\   'python': ['black', 'flake8', 'pylint'],
\}
" Turned spelunker off for the moment because of performance issues with large
" files
let g:enable_spelunker_vim = 0
let g:spelunker_check_type = 1

autocmd ColorScheme * highlight SpelunkerSpellBad cterm=underline ctermfg=160 gui=underline guifg=#de4e4e
autocmd ColorScheme * highlight SpelunkerComplexOrCompoundWord cterm=underline ctermfg=160 gui=underline guifg=#de4e4e

" Show whitespace characters
set list
set listchars=tab:→\
autocmd ColorScheme * highlight NonText ctermfg=235 guifg=#353535

" Highlight extra whitespace
autocmd ColorScheme * highlight ExtraWhitespace guifg=#870000 guibg=#ffa40b
highlight ExtraWhitespace ctermbg=red guibg=red

" Highlight trailing whitespace, spaces before a tab, and tabs not at the
" start of a line
match ExtraWhitespace /\s\+$\| \+\ze\t\|[^\t"#\/]\zs\t\+/
" Disable trailing whitespace match in insert mode.
au InsertEnter * match ExtraWhitespace / \+\ze\t\|[^\t"#\/]\zs\t\+/
" Reenable when leaving insert
au InsertLeave * match ExtraWhitespace /\s\+$\| \+\ze\t\|[^\t"#\/]\zs\t\+/

" Disable Ex mode
map q: <Nop>
nnoremap Q <nop>

" Python formatter
autocmd BufWritePre *.py execute ':Black'

" disable folding
set nofoldenable

autocmd Colorscheme * hi NonText guibg=NONE ctermbg=NONE
                  \ | hi Normal guibg=NONE ctermbg=NONE

" Disable netrw file browser
let loaded_netrwPlugin = 1

filetype plugin indent on
syntax on

set hlsearch

" https://github.com/neovim/neovim/issues/4524#issuecomment-234823996
set hid

" Always show error gutter on left. (Avoid column flickering)
set signcolumn=yes

let g:prettier#autoformat_config_present = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#exec_cmd_async = 1
let g:prettier#config#arrow_parens = 'avoid'

let g:prettier#config#arrow_parens = get(g:,'prettier#config#arrow_parens', 'always')

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  indent = {
    enable = true,
  },
}
EOF
