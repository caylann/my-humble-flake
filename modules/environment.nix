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
      linuxPackages_latest.amneziawg
      amneziawg-go
      amneziawg-tools
    ];

    defaultPackages = [ ];
  };
}
