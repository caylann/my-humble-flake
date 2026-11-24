{ config, lib, pkgs, ... }:

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

  services.displayManager.ly.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [];

  environment.pathsToLink = [ "/share/applications" ];

  nix.settings.experimental-features = ["nix-command" "flakes"];
  
  system.stateVersion = "26.05";
}
