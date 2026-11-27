{
  imports = [
    ./hardware-configuration.nix
    ./modules
  ];

  time.timeZone = "Europe/Samara";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  documentation.nixos.enable = false;

  system.stateVersion = "26.05";
}
