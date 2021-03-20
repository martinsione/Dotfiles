# Apps
alias r="$FILE"
alias sr="sudo $FILE"
alias v="$EDITOR"
alias sv="sudo $EDITOR"
alias code="$GEDITOR"

# Color
alias diff="diff --color=auto"
alias grep="grep --color=auto"

# Adding some default flags
alias cp="cp -iv"
alias mv="mv -iv"
alias mkd="mkdir -pv"
alias rm="rm -iv"
alias rmln="find . -xtype l -delete"

# Listing
alias l="exa -l --group-directories-first"
alias ll="exa -la --group-directories-first"
alias ls="exa --icons -a --group-directories-first"

# Packages
alias p="sudo pacman"
alias upg="paru -Syu --noconfirm"
alias vupg="cd ~/.local/src/neovim && git pull && sudo make clean install && cd -"
alias cleanup="sudo pacman -Rns $(pacman -Qtdq)"

# System
alias bld="make && sudo make clean install"
alias cl="clear"
alias ka="killall"
alias startx="startx $XDG_CONFIG_HOME/X11/xinitrc"

alias vs="nvim --startuptime now.log && nvim now.log && rm -rf now.log"
