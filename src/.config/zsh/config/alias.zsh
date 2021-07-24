## Programs
alias r="$FILE"
alias sr="sudo $FILE"
alias v="$EDITOR"
alias sv="sudo $EDITOR"
alias code="$GEDITOR"
## Color
alias diff="diff --color=auto"
alias grep="grep --color=auto"
## File manipulation
alias md="mkdir -pv"
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -iv"
alias rmln="find . -xtype l -delete"
## Listing
alias l="exa -l --group-directories-first"
alias ll="exa -la --group-directories-first"
## System
alias bld="make && sudo make install"
alias cl="clear"
alias ka="killall"
alias ex="extract"
alias startx="startx $XINITRC"

## Packages
alias npmg='npm i --prefix $HOME/.local/bin/npm'
alias vst="nvim --startuptime test.tmp -c q && nvim test.tmp -c norm\ G && rm -rf test.tmp"
if [[ $DISTRO == "Arch" ]]; then
  alias p="paru --bottomup"
  alias upg="paru -Syu --noconfirm"
  alias cleanup="sudo pacman -Rns $(pacman -Qtdq)"
elif [[ $DISTRO == "Ubuntu" || $DISTRO == 'Pop' ]]; then
  alias upg="sudo apt update && sudo apt upgrade -y"
fi

## Git
alias g="git"
alias ga="git add"
alias gb="git branch"
alias gc="git commit"
alias gcb="git checkout -b"
alias gco="git checkout"
alias gc!="git commit -v --amend"
alias gcm="git commit -m"
alias gcam="git commit -am"
alias gd="git diff"
alias gcl="git clone"
alias gcu="git reset --soft HEAD~1"
alias glg="git lg"
alias gp='git push'
alias gP='git pull'
alias gr='git remote'
alias gm='git merge'
alias gs="git st"
alias gst="git status"

## Tmux
alias t="tmux -u"
alias ta="tmux -u a"
alias tls="tmux ls"
alias tks="tmux kill-session -t"

## Directories
alias d="$HOME/.dotfiles"
alias D="$HOME/Downloads"
alias P="$HOME/Pictures"
alias W="$HOME/Workspace"
alias sc="$HOME/.local/bin"
alias sb="$HOME/.local/bin/statusbar"
alias src="$HOME/.local/src"
alias sto="/mnt/s"
alias cs="/mnt/s/Martin/Study/Courses/"
alias fc="/mnt/s/Martin/Study/Facu"
alias fc1="/mnt/s/Martin/Study/Facu/Cuatrimestres/1"
alias fcp="/mnt/s/Martin/Study/Facu/Cuatrimestres/1/FuPro/Ejercicios/Cpp"
