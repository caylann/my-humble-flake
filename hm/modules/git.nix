{ pkgs, ... }:

{
  home.packages = [ pkgs.git-credential-oauth ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "caylann";
        email = "maxim.sawch@gmail.com";
      };

      credential.helper = [
        "cache --timeout 86400"
        "oauth"
      ];
    };
  };
}
