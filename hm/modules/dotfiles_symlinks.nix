{ config, pkgs, user, ... }:

{
  xdg.configFile = {
    "nvim".source =
      config.lib.file.mkOutOfStoreSymlink "/home/${user}/nixos/dotfiles/nvim";

    "alacritty".source =
      config.lib.file.mkOutOfStoreSymlink "/home/${user}/nixos/dotfiles/alacritty";

    "fastfetch".source =
      config.lib.file.mkOutOfStoreSymlink "/home/${user}/nixos/dotfiles/fastfetch";
      
    "rofi".source =
      config.lib.file.mkOutOfStoreSymlink "/home/${user}/nixos/dotfiles/rofi";

    "dunst".source =
      config.lib.file.mkOutOfStoreSymlink "/home/${user}/nixos/dotfiles/dunst";

    "flameshot".source =
      config.lib.file.mkOutOfStoreSymlink "/home/${user}/nixos/dotfiles/flameshot";

    "picom".source =
      config.lib.file.mkOutOfStoreSymlink "/home/${user}/nixos/dotfiles/picom";

    "ranger".source =
      config.lib.file.mkOutOfStoreSymlink "/home/${user}/nixos/dotfiles/ranger";
  };
}
