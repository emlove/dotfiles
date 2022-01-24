" Wayland clipboard provider that strips carriage returns (GTK3 issue).
" This is needed because currently there's an issue where GTK3 applications on
" Wayland contain carriage returns at the end of the lines (this is a root
" issue that needs to be fixed).
" See: https://github.com/neovim/neovim/issues/10223#issuecomment-521952122
" See: https://gitlab.gnome.org/GNOME/gtk/issues/2307
let g:clipboard = {
      \   'name': 'wayland-strip-carriage',
      \   'copy': {
      \      '+': 'wl-copy --foreground --type text/plain',
      \      '*': 'wl-copy --foreground --type text/plain --primary',
      \    },
      \   'paste': {
      \      '+': {-> systemlist('(wl-paste -t UTF8_STRING 2>/dev/null || wl-paste -t text ) | tr -d "\r"')},
      \      '*': {-> systemlist('(wl-paste -t UTF8_STRING 2>/dev/null || wl-paste -t text ) | tr -d "\r"')},
      \   },
      \   'cache_enabled': 1,
      \ }
