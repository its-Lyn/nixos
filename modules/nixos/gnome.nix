{ config, lib, pkgs, ...}:
{
  options = {
    eve.gnome.enable = lib.mkEnableOption "Enable the GNOME configuration module.";
    eve.gnome.extensions = lib.mkEnableOption "Enable Extensions with the GNOME Desktop.";
  };

  config = lib.mkIf config.eve.gnome.enable {
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    users.users.evelyn = lib.mkIf config.eve.gnome.extensions {
      packages = with pkgs; [
        # Gnome Extensions.
        gnomeExtensions.runcat
        gnomeExtensions.dash-to-dock
        gnomeExtensions.light-style
        gnomeExtensions.overview-background
        gnomeExtensions.logo-menu
        gnomeExtensions.user-themes

        gnome.gnome-tweaks
        gnome-extension-manager
      ];
    };
  };
}
