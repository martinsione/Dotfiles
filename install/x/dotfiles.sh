#!/usr/bin/env bash

# Script name: dotfiles
# Description: Script to deploy my dotfiles easily.
# Dependencies: git, curl, zsh

export repo_host="https://github.com/"
export repo_path="martinsione/dotfiles.git"
export dotfiles_dir="$HOME/.dotfiles"

dirs=(
  ~/.cache/zsh
  ~/.config
  ~/.local
  ~/Documents
  ~/Downloads
  ~/Pictures
  ~/Repos/Personal
  ~/Repos/Work
)

symlinks=(
  .config/git
  .config/htop
  .config/kitty
  .config/nvim
  .config/ranger
  .config/tmux
  .config/zsh
  .local/bin
  .zshrc
)

## End of configuration
set -e

install_dependencies() {
  local progs="git curl zsh"
  [ -x "$(command -v pacman)" ] && sudo pacman -Syy && sudo pacman -S --noconfirm $progs && return
  [ -x "$(command -v apt-get)" ] && sudo apt update && sudo apt install -y $progs && return
}

clone_repo() {
  if [ -d "$HOME/dotfiles" ]; then
    mv "$HOME/dotfiles" "${dotfiles_dir}";
  elif [ ! -d "${dotfiles_dir}" ]; then
    git clone "${repo_host}/${repo_path}" "${dotfiles_dir}"
  fi

  if [ -d "${dotfiles_dir}" ]; then 
    cd ${dotfiles_dir} && git submodule update --init --recursive
    ## Change to ssh url
    git remote set-url origin git@github.com:${repo_path}
  fi
}

symlink_files() {
  for name in "${symlinks[@]}"; do
    if [ ! -e "$name" ]; then
      ln -srfv "${dotfiles_dir}/src/${name}" "$HOME/${name}"
    else
      echo "${name} already exists."
    fi
  done
}

create_dirs() {
  for name in "${dirs[@]}"; do mkdir -p "${name}"; done
}

change_shell() {
  chsh -s $(which zsh)
  sh -c "$(curl -fsSL https://starship.rs/install.sh)"
}


## Start of the script
install_dependencies
clone_repo
create_dirs
symlink_files
change_shell