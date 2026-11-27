{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nerd-fonts.terminess-ttf
    noto-fonts
    noto-fonts-color-emoji
  ];

  stylix = {
    enable = true;
    polarity = "dark";

    base16Scheme = {
      scheme = "monochrome-blue";
      author = "caylann";

      base00 = "070909";
      base01 = "121617";
      base02 = "1f2628";
      base03 = "56666c";
      base04 = "999ea0";
      base05 = "f5f5f5";
      base06 = "f7f8f7";
      base07 = "fbfbfb";
      base08 = "778899";
      base09 = "859ba3";
      base0A = "b4c3c8";
      base0B = "999ea0";
      base0C = "d1d5d8";
      base0D = "778899";
      base0E = "c2cfd4";
      base0F = "5e7178";
    };

    cursor = {
      name = "DMZ-Black";
      size = 24;
      package = pkgs.vanilla-dmz;
    };

    fonts = {
      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-color-emoji;
      };
      monospace = {
        name = "Terminess Nerd Font";
        package = pkgs.nerd-fonts.terminess-ttf;
      };
      sansSerif = {
        name = "Terminess Nerd Font";
        package = pkgs.nerd-fonts.terminess-ttf;
      };
      serif = {
        name = "Terminess Nerd Font";
        package = pkgs.nerd-fonts.terminess-ttf;
      };

      sizes = {
        applications = 14;
      };
    };
  };
}
