{ pkgs, ... }:

{
  home.packages = with pkgs; [

    # Desktop apps
    anki
    gthumb
    imv
    kdePackages.okular
    libreoffice
    librewolf
    mpv
    obsidian
    obs-studio
    qalculate-gtk
    vesktop

    # Software I use
    alacritty
    flameshot
    ranger
    rofi-unwrapped

    # CLI utils
    cava
    colorpanes
    fastfetch
    fzf
    htop
    mediainfo
    ntfs3g
    pfetch
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
