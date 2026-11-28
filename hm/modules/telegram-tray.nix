{ pkgs, ... }:

let
  telegram-tray = pkgs.symlinkJoin {
    name = "telegram-desktop";
    paths = [ pkgs.telegram-desktop ];
    buildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/Telegram \
        --set XDG_CURRENT_DESKTOP "" \
        --unset DBUS_SESSION_BUS_ADDRESS
    '';
  };
in
{
  home.packages = [
    telegram-tray
  ];
}
