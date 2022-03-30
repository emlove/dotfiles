call plug#begin('~/.vim/plugged')

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'xiyaowong/nvim-transparent'

Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'lewis6991/spellsitter.nvim'

Plug 'rmagatti/auto-session'

Plug 'AndrewRadev/sideways.vim'

Plug 'w0rp/ale'

Plug 'gpanders/editorconfig.nvim'

Plug 'sbdchd/neoformat'

Plug 'norcalli/nvim-colorizer.lua'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

call plug#end()

set termguicolors
let g:tokyonight_transparent = 1
let g:tokyonight_style = "night"
colorscheme tokyonight

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

nnoremap <leader>f :Telescope find_files<cr>

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
\   'ruby': [],
\}

" Show whitespace characters
set list
set listchars=tab:→\ ,
highlight NonText ctermfg=235 guifg=#353535

" Highlight extra whitespace
highlight ExtraWhitespace guifg=#870000 guibg=#ffa40b
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

" disable folding
set nofoldenable

highlight NonText guibg=NONE ctermbg=NONE
highlight Normal guibg=NONE ctermbg=NONE

" Disable netrw file browser
let loaded_netrwPlugin = 1

set hlsearch

" https://github.com/neovim/neovim/issues/4524#issuecomment-234823996
set hid

" Always show error gutter on left. (Avoid column flickering)
set signcolumn=yes

let g:neoformat_try_node_exe = 1
let g:neoformat_enabled_ruby = []

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

set spell

nm <silent> <F1> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")
    \ . '> trans<' . synIDattr(synID(line("."),col("."),0),"name")
    \ . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
    \ . ">"<CR>

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

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

nvim_lsp["solargraph"].setup {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    solargraph = {
      autoformat = false,
      formatting = false,
      completion = false,
      diagnostic = false,
      folding = false,
      references = false,
      rename = false,
      symbols = false,
    }
  },
}

require('telescope').setup {}
require('telescope').load_extension('fzf')
require('spellsitter').setup()
require('auto-session').setup {}
require("transparent").setup({
    enable = true,
    extra_groups = {
        "TelescopeNormal",
        "TelescopeBorder",
    },
})

vim.g.tokyonight_transparent = 1

-- Disable rubocop diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end


require('lualine').setup {
    options = {
        theme = "tokyonight",
    }
}

EOF
