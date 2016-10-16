#!/bin/bash

DEV_DIR=dev

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/supercrabtree/k "$HOME"/.oh-my-zsh/custom/plugins/k

ln -sf ~/"${DEV_DIR}"/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/"${DEV_DIR}"/dotfiles/zsh/.aliases ~/.aliases
ln -sf ~/"${DEV_DIR}"/dotfiles/zsh/.env ~/.env

ln -sf ~/"${DEV_DIR}"/dotfiles/vim/.vimrc ~/.vimrc
ln -sf ~/"${DEV_DIR}"/dotfiles/tmux/.tmux.conf ~/.tmux.conf
