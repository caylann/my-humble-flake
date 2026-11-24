{ pkgs, user, ... }:

{
  programs.bash.enable = true;

  users = {
    defaultUserShell = pkgs.bash;
    users.${user} = {
      isNormalUser = true;
      extraGroups = [ "wheel" "audio" "video" "input" ];
    };
  };
}
