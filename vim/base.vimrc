call plug#begin('~/.vim/plugged')

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'xiyaowong/nvim-transparent'

" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
Plug 'romgrk/barbar.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'lewis6991/spellsitter.nvim'

Plug 'rmagatti/auto-session'

Plug 'AndrewRadev/sideways.vim'

Plug 'w0rp/ale'

Plug 'gpanders/editorconfig.nvim'

Plug 'sbdchd/neoformat'

Plug 'norcalli/nvim-colorizer.lua'
Plug 'lewis6991/gitsigns.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'ruifm/gitlinker.nvim'

Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', { 'branch': 'artifacts'}

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
noremap <C-c> <Esc>
noremap <C-c> <Esc>
noremap <C-c> <Esc>

" Disable mouse
set mouse-=a
"
" Buffer navigation
map gn :BufferNext<cr>
map gp :BufferPrevious<cr>
map gN :BufferPrevious<cr>

nnoremap <c-h> :SidewaysLeft<cr>
nnoremap <c-l> :SidewaysRight<cr>

nnoremap <c-]> :Telescope lsp_definitions<cr>

nnoremap <leader>ff :Telescope find_files<cr>
nnoremap <leader>fg :Telescope live_grep<cr>
nnoremap <leader>fb :Telescope buffers<cr>
nnoremap <leader>fr :Telescope lsp_references<cr>

nnoremap <leader>gc :Telescope git_branches<cr>
nnoremap <leader>gg :Telescope git_status<cr>
nnoremap <leader>gv :Telescope git_stash<cr>

" Space to select auto completion
imap <expr> <space> pumvisible() && complete_info().selected != -1 ? '<cr>' : '<space>'

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
  autocmd BufWritePre * Neoformat
augroup END

set spell

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  indent = {
    enable = true,
  },
}

local nvim_lsp = require('lspconfig')
local coq = require "coq"

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local xible_volume_change = function(client, bufnr)
  local function map(mode, l, r, opts)
    opts = opts or {}
    opts.buffer = bufnr
    vim.keymap.set(mode, l, r, opts)
  end

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }
  map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
  map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
  map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
  map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
  map('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
  map('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
  map('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
  map('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  map('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
  map('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  map('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
  map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
  map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
  map('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')
  map("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")

end

vim.cmd('COQnow --shut-up')
nvim_lsp.solargraph.setup(coq.lsp_ensure_capabilities({
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
}))
nvim_lsp.eslint.setup(coq.lsp_ensure_capabilities({
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
}))

require('telescope').setup {
    defaults = {
        file_ignore_patterns = { ".git" }
    },
    pickers = {
        find_files = {
            hidden = true,
        },
    },
}
require('telescope').load_extension('fzf')
require('spellsitter').setup()
require('auto-session').setup {}
require("transparent").setup({
    enable = true,
    extra_groups = {
        "TelescopeNormal",
        "TelescopeBorder",
        "BufferInactive",
        "BufferInactiveSign",
        "BufferTabpageFill",
        "BufferInactive",
        "BufferInactive",
        "BufferOffset",
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
require('gitsigns').setup{
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- Actions
    map('n', '<leader>gs', ':Gitsigns stage_hunk<CR>')
    map('v', '<leader>gs', ':Gitsigns stage_hunk<CR>')
    map('n', '<leader>gr', ':Gitsigns reset_hunk<CR>')
    map('v', '<leader>gr', ':Gitsigns reset_hunk<CR>')
    map('n', '<leader>gS', gs.stage_buffer)
    map('n', '<leader>gu', gs.undo_stage_hunk)
    map('n', '<leader>gR', gs.reset_buffer)
    map('n', '<leader>gp', gs.preview_hunk)
    map('n', '<leader>gb', function() gs.blame_line{full=true} end)
    map('n', '<leader>gd', gs.diffthis)
    map('n', '<leader>gD', function() gs.diffthis('~') end)
    map('n', '<leader>gtd', gs.toggle_deleted)

    -- Text object
    map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
require"gitlinker".setup({
  opts = {
    action_callback = require"gitlinker.actions".open_in_browser,
    print_url = false,
  },
  mappings = "<leader>gy"
})

-- Set barbar's options
vim.g.bufferline = {
  closable = false,
  clickable = false,
  -- If true, new buffers will be inserted at the start/end of the list.
  -- Default is to insert after current buffer.
  insert_at_end = true,
}
EOF
