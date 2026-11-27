{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nerd-fonts.terminess-ttf
  ];

  stylix = {
    enable = true;

    targets = {
      gtk = {
        extraCss = ''
          decoration,
          window,
          window.background,
          window.csd {
            border: none;
            border-radius: 0;
            box-shadow: none;
            margin: 0;
            padding: 0;
          }

          * {
            font-weight: bold;
          }
        '';
      };
    };

    icons = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };
  };
}
