{ lib, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    package = null;
    config = {
      keybindings = lib.mkForce { };
      bars = lib.mkForce [ ];
      modes = lib.mkForce { };
    };
    extraConfig = ''
      include /home/caylann/nixos/dotfiles/sway/config
    '';
  };
}
