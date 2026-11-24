{ config, lib, pkgs, user, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules
    ];
  
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      libva-vdpau-driver
      libvdpau-va-gl
    ];
  };
  # systemd-boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = [ "video=1920x1080@60" ];
  boot.loader.systemd-boot.consoleMode = "max";

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixie";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Samara";

  services.xserver = {
    enable = true;
    displayManager.startx.enable = true;
    videoDrivers = [ "amdgpu" ];
    autoRepeatDelay = 245;
    autoRepeatInterval = 32;
    dpi = 96;

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
        src = ./dotfiles/dwm;
      });
    };

    displayManager = {
      sessionCommands = ''
        ${pkgs.xrandr}/bin/xrandr --output HDMI-A-0 --mode 1920x1080 --rate 60 --primary --set "Broadcast RGB" "Full" &
    	  ${pkgs.feh}/bin/feh --bg-fill /home/${user}/nixos/dotfiles/assets/plane1.jpg &
    	  ${pkgs.xset}/bin/xset s off &
    	  ${pkgs.xset}/bin/xset s noblank &
    	  ${pkgs.xset}/bin/xset -dpms &
        ${pkgs.slstatus.overrideAttrs (oldAttrs: { src = ./dotfiles/slstatus; })}/bin/slstatus &
        ${pkgs.picom}/bin/picom -b &
        ${pkgs.dunst}/bin/dunst &
      '';
    };

    deviceSection = ''
      Option "TearFree" "true"
    '';
  };
  
  services.displayManager.ly.enable = true;
  
  users.users.caylann = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "video" "input" ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    alacritty
    rofi
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];
  
  system.stateVersion = "26.05";
}
