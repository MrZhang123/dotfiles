#!/usr/bin/env bash

# plugin manager
# git clone https://github.com/wbthomason/packer.nvim \
#   ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# conf
mkdir -p ~/.config/nvim
cp -r ./init.lua ./lua ./after ~/.config/nvim/

# lazy.nvim

git clone https://github.com/folke/lazy.nvim.git ~/.local/share/nvim/lazy/

# Language servers
# yarn global add bash-language-server
# css,eslint,html,json server
yarn global add vscode-langservers-extracted
# golang
go install golang.org/x/tools/gopls@latest
# ts,js
yarn global add typescript typescript-language-server
# vim
# yarn global add vim-language-server

# yarn global add yaml-language-server

# Lua
# brew install ninja
# cd ~/dev
# git clone https://github.com/sumneko/lua-language-server
# cd lua-language-server
# git submodule update --init --recursive
# cd 3rd/luamake
# compile/install.sh
# cd ../..
# ./3rd/luamake/luamake rebuild

# echo "Run `nvim +PackerInstall` to finish setup"
