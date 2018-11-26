export PATH="$HOME/.local/bin:$PATH"
export VDPAU_DRIVER=va_gl
export ANDROID_SDK_PATH="/opt/android-sdk-update-manager"
if [ "$0" = "/etc/gdm/Xsession" -a "$DESKTOP_SESSION" = "i3" ]; then
    export $(gnome-keyring-daemon --start)
fi
if [ -x /usr/bin/gpg-agent ]; then
    eval "$(/usr/bin/gpg-agent --daemon 2>/dev/null)"
fi
export GPG_TTY=$(tty)
