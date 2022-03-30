export PATH="$HOME/.local/bin:$PATH"
export VDPAU_DRIVER=va_gl
export ANDROID_SDK_PATH="/opt/android-sdk-update-manager"
export XCURSOR_THEME="Adwaita"
export XCURSOR_SIZE="48"
export BROWSER="firefox"

# https://bugzilla.rpmfusion.org/show_bug.cgi?id=5383#c19
export QT_QPA_PLATFORM=xcb

if [ "$0" = "/etc/gdm/Xsession" -a "$DESKTOP_SESSION" = "i3" ]; then
    export $(gnome-keyring-daemon --start)
fi

if [ -x /usr/bin/gpg-agent ]; then
    eval "$(/usr/bin/gpg-agent --daemon 2>/dev/null)"
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
