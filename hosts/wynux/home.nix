{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.self.homeManagerModules.fish
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "evelyn";
  home.homeDirectory = "/home/evelyn";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.file = {
    ".config/fish/config.fish".source = ./config/fish/config.fish;
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/evelyn/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
