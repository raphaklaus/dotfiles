#!/bin/bash

# Build essentials
sudo apt update -y
sudo apt install build-essential -y
sudo apt install libssl-dev automake autoconf libncurses5-dev unzip -y

# Zsh and Oh-My-Zsh
sudo apt-get install zsh -y
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2
asdf plugin add nodejs 
asdf plugin add elixir 
asdf plugin add erlang 
asdf plugin add golang 
asdf plugin add rust 
asdf plugin add lazygit 

# asdf install my favorite languages and tools

asdf install nodejs latest:16
asdf install elixir latest
asdf install erlang latest
asdf install rust latest
asdf install golang latest
asdf install lazygit latest

npm install -g yarn

# NeoVim

sudo apt install xclip
sudo apt install vim
asdf plugin add neovim 
asdf install neovim latest
mkdir -p ~/.config/nvim

# Vim Plug

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Misc tools

sudo apt-get install ripgrep -y
