" Use system clipboard for unnamed register
set clipboard+=unnamedplus

" Wayland clipboard provider that strips carriage returns (GTK3 issue).
" This is needed because currently there's an issue where GTK3 applications on
" Wayland contain carriage returns at the end of the lines (this is a root
" issue that needs to be fixed).
" See: https://github.com/neovim/neovim/issues/10223#issuecomment-521952122
" See: https://gitlab.gnome.org/GNOME/gtk/issues/2307
let g:clipboard = {
      \   'name': 'wayland-strip-carriage',
      \   'copy': {
      \      '+': 'reattach-to-user-namespace pbcopy',
      \      '*': 'reattach-to-user-namespace pbcopy',
      \    },
      \   'paste': {
      \      '+': {-> systemlist('reattach-to-user-namespace pbpaste')},
      \      '*': {-> systemlist('reattach-to-user-namespace pbpaste')},
      \   },
      \   'cache_enabled': 1,
      \ }
