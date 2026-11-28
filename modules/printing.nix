{ pkgs, ... }:

{
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      cnijfilter2
      gutenprint
      cups-bjnp
    ];
  };
}
