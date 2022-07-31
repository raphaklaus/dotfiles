#!/bin/bash

# Build essentials
sudo apt update -y
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev -y

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

# Tmux Plugin Manager

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Misc tools

sudo apt-get install ripgrep -y
