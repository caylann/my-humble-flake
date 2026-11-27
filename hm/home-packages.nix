{ pkgs, ... }:

{
  home.packages = with pkgs; [

    # Desktop apps
    librewolf
    obsidian
    telegram-desktop
    vesktop
    kdePackages.okular
    libreoffice
    obs-studio
    vlc

    # Software I use
    alacritty
    rofi-unwrapped
    flameshot
    ranger

    # CLI utils
    fastfetch
    htop
    ueberzugpp
    xsel
    fzf
    ntfs3g
    ripgrep
    unzip

    # For Neovim
    neovim
    gcc
    tree-sitter
    clang-tools
    lua-language-server
    stylua
    nil
    nixfmt
    statix

  ];
}
