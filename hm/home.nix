{
  imports = [
    ./modules
    ./home-packages.nix
  ];

  home = {
    username = "caylann";
    homeDirectory = "/home/caylann";
    stateVersion = "26.05";

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      TERMINAL = "alacritty";
    };

  };
}
