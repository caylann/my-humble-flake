{ config, pkgs, inputs, ... }: 

{
  imports = [
    ./modules
  ];

  home = {
    username = "caylann";
    homeDirectory = "/home/caylann";
    stateVersion = "26.05";

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      TERMINAL = "alacritty";
    };

    packages = with pkgs; [
    
      # Desktop apps
      librewolf
      obsidian
      telegram-desktop
      #discord
      libreoffice
      kdePackages.okular
      steam

      # QOL
      alacritty
      rofi
      fastfetch
      htop
      flameshot
      ranger
      xclip
      ueberzugpp

      nerd-fonts.terminess-ttf

      # Neovim
      neovim
      gcc
      tree-sitter
      clang-tools
      lua-language-server
      stylua
    ];
  };

  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [ "Alacritty.desktop" ];
    };
  };
}
