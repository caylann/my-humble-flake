{ pkgs, user, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment = {
    etc."amnezia/amneziawg/warp.conf".source = "/home/${user}/warp.conf";

    pathsToLink = [
      "/share/applications"
      "/share/xdg-desktop-portal"
    ];

    systemPackages = with pkgs; [
      amneziawg-go
      amneziawg-tools
      gcc
      linuxPackages_latest.amneziawg
    ];

    defaultPackages = [ ];
  };
}
