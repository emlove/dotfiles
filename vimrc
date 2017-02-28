" Expand tabs into spaces
set expandtab

" Use smart tabs
set smarttab

" Tab length = 4 spaces
set shiftwidth=4
set tabstop=4

" Auto indent and smart indent
set autoindent
filetype plugin indent on
" set si : Removed based on http://stackoverflow.com/a/18415867

" Use smart case for text searches
set ignorecase
set smartcase

" Show relative line numbers
set number
set relativenumber
highlight LineNr ctermfg=236
highlight CursorLineNr ctermfg=236

set background=dark
