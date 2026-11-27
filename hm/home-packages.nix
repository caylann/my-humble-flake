{ pkgs, ... }:

{
  home.packages = with pkgs; [

    # Desktop apps
    anki
    imv
    kdePackages.okular
    libreoffice
    librewolf
    mpv
    obsidian
    obs-studio
    qalculate-gtk
    telegram-desktop
    vesktop

    # Software I use
    alacritty
    flameshot
    ranger
    rofi-unwrapped

    # CLI utils
    fastfetch
    fzf
    htop
    mediainfo
    ntfs3g
    playerctl
    ripgrep
    udisks
    ueberzugpp
    unzip
    w3m
    wget
    xsel
    yt-dlp
    zip

    # For Neovim
    neovim
    tree-sitter
    clang-tools
    lua-language-server
    stylua
    nil
    nixfmt
    statix

  ];
}
