{
  pkgs,
  user,
  ...
}:

{
  services.displayManager.ly.enable = true;

  services.xserver = {
    enable = true;
    displayManager.startx.enable = true;
    videoDrivers = [ "amdgpu" ];
    autoRepeatDelay = 245;
    autoRepeatInterval = 32;
    dpi = 96;

    excludePackages = [ pkgs.xterm ];

    serverFlagsSection = ''
      Option "BlankTime" "0"
      Option "StandbyTime" "0"
      Option "SuspendTime" "0"
      Option "OffTime" "0"
      Option "DPMS" "false"
    '';

    xkb = {
      layout = "us,ru";
      options = "grp:alt_shift_toggle";
    };

    windowManager.dwm = {
      enable = true;
      package = pkgs.dwm.overrideAttrs (oldAttrs: {
        src = ../dotfiles/dwm;
      });
    };

    displayManager = {
      sessionCommands = ''
        ${pkgs.xrandr}/bin/xrandr --output HDMI-A-0 --mode 1920x1080 --rate 60 --primary --set "Broadcast RGB" "Full" &
        ${pkgs.feh}/bin/feh --bg-fill /home/${user}/nixos/dotfiles/assets/plane1.jpg &
        ${pkgs.xset}/bin/xset s off &
        ${pkgs.xset}/bin/xset s noblank &
        ${pkgs.xset}/bin/xset -dpms &
        ${pkgs.polybarFull}/bin/polybar &
        ${pkgs.picom}/bin/picom -b &
        ${pkgs.dunst}/bin/dunst &
      '';
    };

    deviceSection = ''
      Option "TearFree" "true"
    '';
  };
}
