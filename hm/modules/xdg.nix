{ pkgs, ... }:

{
  xdg = {
    portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      config = {
        common = {
          default = [ "gtk" ];
        };
      };
    };

    terminal-exec = {
      enable = true;
      settings = {
        default = [ "Alacritty.desktop" ];
      };
    };

    desktopEntries = {
      nvim = {
        name = "Neovim";
        genericName = "Text Editor";
        exec = "nvim %F";
        icon = "nvim";
        terminal = true;
        categories = [ "Utility" "TextEditor" ];
        mimeType = [
          "text/english"
          "text/plain"
          "text/x-makefile"
          "text/x-c++hdr"
          "text/x-c++src"
          "text/x-chdr"
          "text/x-csrc"
          "text/x-java"
          "text/x-moc"
          "text/x-pascal"
          "text/x-tcl"
          "text/x-tex"
          "application/x-shellscript"
          "text/x-c"
          "text/x-c++"
        ];
      };
      steam = {
        name = "Steam";
        genericName = "Game Launcher";
        exec = "steam";
        icon = "steam";
        terminal = false;
      };
    };

    dataFile = {
      "applications/rofi.desktop".text = ''
        [Desktop Entry]
        Type=Application
        Name=Rofi
        NoDisplay=true
      '';
      "applications/rofi-theme-selector.desktop".text = ''
        [Desktop Entry]
        Type=Application
        Name=Rofi Theme Selector
        NoDisplay=true
      '';
      "applications/math.desktop".text = ''
        [Desktop Entry]
        Type=Application
        Name=LibreOffice Math
        NoDisplay=true
      '';
      "applications/base.desktop".text = ''
        [Desktop Entry]
        Type=Application
        Name=LibreOffice Base
        NoDisplay=true
      '';
      "applications/draw.desktop".text = ''
        [Desktop Entry]
        Type=Application
        Name=LibreOffice Draw
        NoDisplay=true
      '';
      "applications/impress.desktop".text = ''
        [Desktop Entry]
        Type=Application
        Name=LibreOffice Impress
        NoDisplay=true
      '';
      "applications/writer.desktop".text = ''
        [Desktop Entry]
        Type=Application
        Name=LibreOffice Writer
        NoDisplay=true
      '';
      "applications/calc.desktop".text = ''
        [Desktop Entry]
        Type=Application
        Name=LibreOffice Calc
        NoDisplay=true
      '';
      "applications/qt5ct.desktop".text = ''
        [Desktop Entry]
        Type=Application
        Name=Qt5 Settings
        NoDisplay=true
      '';
      "applications/qt6ct.desktop".text = ''
        [Desktop Entry]
        Type=Application
        Name=Qt6 Settings
        NoDisplay=true
      '';
      "applications/kvantummanager.desktop".text = ''
        [Desktop Entry]
        Type=Application
        Name=Kvantum Manager
        NoDisplay=true
      '';
    };
  };
}
