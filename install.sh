#!/bin/bash

DEV_DIR=dev

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

brew bundle

git clone https://github.com/supercrabtree/k "$HOME"/.oh-my-zsh/custom/plugins/k

ln -sf "${HOME}"/"${DEV_DIR}"/tools/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf "${HOME}"/"${DEV_DIR}"/tools/dotfiles/zsh/.aliases ~/.aliases
ln -sf "${HOME}"/"${DEV_DIR}"/tools/dotfiles/zsh/.env ~/.env

ln -sf "${HOME}"/"${DEV_DIR}"/tools/dotfiles/vim/.vimrc ~/.vimrc
ln -sf "${HOME}"/"${DEV_DIR}"/tools/dotfiles/tmux/.tmux.conf ~/.tmux.conf

mkdir -p ~/.config/
ln -sf "${HOME}"/"${DEV_DIR}"/tools/dotfiles/nvim ~/.config/nvim
