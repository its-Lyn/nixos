{ inputs, config, pkgs, ... }:
{
  imports = [
    inputs.self.homeManagerModules.hyfetch
    inputs.self.homeManagerModules.gtk
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "evelyn";
  home.homeDirectory = "/home/evelyn";

  home.stateVersion = "23.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
