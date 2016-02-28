" Expand tabs into spaces
set expandtab

" Use smart tabs
set smarttab

" Tab length = 4 spaces
set shiftwidth=4
set tabstop=4

" Highlight spaces at start of line or trailing whitespace
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /^ \+\|\s\+$/

" Auto indent and smart indent
set ai
set si

" Use smart case for text searches
set ignorecase
set smartcase
