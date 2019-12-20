export PATH="$HOME/.local/bin:$PATH"
export VDPAU_DRIVER=va_gl
export ANDROID_SDK_PATH="/opt/android-sdk-update-manager"
export XCURSOR_THEME="Adwaita"
export XCURSOR_SIZE="48"

# https://bugzilla.rpmfusion.org/show_bug.cgi?id=5383#c19
export QT_QPA_PLATFORM=xcb

if [ "$0" = "/etc/gdm/Xsession" -a "$DESKTOP_SESSION" = "i3" ]; then
    export $(gnome-keyring-daemon --start)
fi

if [ -x /usr/bin/gpg-agent ]; then
    eval "$(/usr/bin/gpg-agent --daemon 2>/dev/null)"
fi

export GPG_TTY=$(tty)
if [[ -d "$HOME/src/nutshell/nub" ]]; then
    eval "$($HOME/src/nutshell/nub/bin/nub init -)"
fi

if command -v beet >/dev/null 2>&1 ; then
    eval "$(/usr/bin/beet completion)"
fi
