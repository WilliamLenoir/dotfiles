#!/bin/bash

# init directories
mkdir -p ~/.tmux/

# install tpm the tmux pacakge manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# create a symbolic link on the versioned tmux config
# which is in th neovim repo
# TODO: move this config in a dedicated repo or in a global .config repo
ln -s ~/.config/nvim/tmux/.tmux.conf ~/.tmux.conf

echo "Now you can run tmux"
echo "> tmux"
echo "IMPORTANT: you have to press <c-b>I (capital I) to install the tmux plugins"

echo "if you want to re-source the tmux config you can do:"
echo "> tmux source ~/.tmux.conf"
