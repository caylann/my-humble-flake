{ pkgs, ... }:

let
  polybarDwm = pkgs.polybarFull.overrideAttrs (oldAttrs: {
    version = "3.7.1-dwm";
    src = pkgs.fetchFromGitHub {
      owner = "pgrondek";
      repo = "polybar-dwm";
      rev = "09eac084494d90310a5a27a01b32dc515f6db352";
      hash = "sha256-CeJ47CqzO2KZ+QyebxJtramJfVHfdsVgREcFAE7zdeo=";
      fetchSubmodules = true;
    };
    buildInputs = (oldAttrs.buildInputs or [ ]) ++ [ pkgs.jsoncpp ];
    cmakeFlags = (oldAttrs.cmakeFlags or [ ]) ++ [
      "-DCMAKE_POLICY_VERSION_MINIMUM=3.5"
    ];
  });
in
{
  home.packages = [ polybarDwm ];
}
