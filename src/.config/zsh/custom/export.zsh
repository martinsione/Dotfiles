# Set encoding
export LANG=en_US.UTF-8

# Path
export PATH="$PATH:$(du "$HOME/.local/bin" | cut -f2 | paste -sd ':')"
export PATH="$PATH:$(du "$HOME/.local/bin/statusbar" | cut -f2 | paste -sd ':')"

# Default Programs
export BROWSER="brave"
export EDITOR="nvim"
export FILE="ranger"
export GEDITOR="codium"
export GFILE="pcmanfm"
export MAIL="thunderbird"
export READER="zathura"
export TERMINAL="kitty"

# XDG paths
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# ~/ Clean-up:
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/zsh/inputrc"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export WINEPREFIX="${XDG_DATA_HOME:-$HOME/.local/share}/wineprefixes/default"
export KODI_DATA="${XDG_DATA_HOME:-$HOME/.local/share}/kodi"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export STARSHIP_CONFIG=~/.config/zsh/starship

# Other program settings:
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"
export LESSHISTFILE=-                       # Disable hist files
export MANPAGER="nvim -c 'set ft=man' -"
export AWT_TOOLKIT="MToolkit wmname LG3D"	  #May have to install wmname
export _JAVA_AWT_WM_NONREPARENTING=1        # Fix for Java applications in dwm

