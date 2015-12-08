export PATH="$HOME/.local/bin:$PATH"
export VDPAU_DRIVER=va_gl
if [ "$0" = "/etc/gdm/Xsession" -a "$DESKTOP_SESSION" = "i3" ]; then
    export $(gnome-keyring-daemon --start)
fi
