{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    # Shells
    zsh
    oh-my-zsh

    # Editors
    vim
    neovim
    lunarvim
    vscodium

    # Utils
    tmux
    fira-code-symbols
    nerdfonts
    lazygit
    jq

    # Node.js (includes npm)
    nodejs_18

    # LLMs and chat services
    aider-chat
    ollama

    # Database
    postgresql

    # Docker
    colima
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
    zsh
  '';
}
