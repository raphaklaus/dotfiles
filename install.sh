#!/bin/bash

# Zsh and Oh-My-Zsh
sudo apt-get install zsh -y
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2
asdf plugin install nodejs latest
asdf plugin install elixir latest
asdf plugin install erlang latest
asdf plugin install golang latest
asdf plugin install rust latest
asdf plugin install lazygit latest

# asdf install my favorite languages and tools

asdf install nodejs latest
asdf install elixir latest
asdf install erlang latest
asdf plugin install rust latest
asdf plugin install lazygit latest

# NeoVim

asdf plugin install neovim latest
mkdir -p ~/.config/nvim

# Vim Plug

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Misc tools

sudo apt-get install ripgrep -y
