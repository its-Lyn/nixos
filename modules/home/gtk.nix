{ pkgs, ... }:
{
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/background" = {
        "picture-uri" = "/etc/nixos/modules/home/config/cirno-wallpaper.jpg";
      };
    };
  };

  gtk = {
    enable = true;

    iconTheme = {
      name    = "tela-circle-icon-theme";
      package = pkgs.tela-circle-icon-theme;
    };
  };
}
