{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    # Shells
    zsh

    # Editors
    vim
    neovim
    lunarvim
    vscodium

    # Utils
    tmux

    # Node.js (includes npm)
    nodejs_18

    # Database
    postgresql

    # Docker
    docker
    docker-compose

    # Build tools
    gcc
    gnumake

    # Python
    python3

    # Additional useful tools
    git
    curl
    wget
  ];

  shellHook = ''
    # Set Zsh as the shell for this environment
    export SHELL=${pkgs.zsh}/bin/zsh
    # Set up Node.js environment
    echo "Development environment loaded!"
  '';
}
