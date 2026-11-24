{ config, pkgs, inputs, ... }: 

{
  imports = [
    ./modules
  ];

  home = {
    username = "caylann";
    homeDirectory = "/home/caylann";
    stateVersion = "26.05";
  }; 

  home.packages = with pkgs; [
    
    # Desktop apps
    librewolf
    obsidian
    telegram-desktop
    #discord
    libreoffice
    kdePackages.okular
    steam

    # QOL
    fastfetch
    htop
    flameshot
    ranger
    xclip

    nerd-fonts.terminess-ttf

    # Neovim
    neovim
    gcc
    tree-sitter
    clang-tools
    lua-language-server
    stylua
  ];
}
