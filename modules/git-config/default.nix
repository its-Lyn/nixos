{ config, lib, ... }: {
  options = {
    lyn.git-config.enable = lib.mkEnableOption "enable lyn's git-config";
  };

  config = lib.mkIf config.lyn.git-config.enable {
    programs.git = {
      enable = true;
      lfs.enable = true;
      config = {
        alias = {
          st = "status";
          ci = "commit";
          co = "checkout";
          cl = "clone";
          d = "diff";
          dc = "diff --cached";
          l = "log";
          lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cD) %C(bold blue)<%an>%Creset' --abbrev-commit";
        };
        user = {
          name = "its-Lyn";
          email = "14388419+its-Lyn@users.noreploy.github.com";
        };
      };
    };

    programs.ssh.extraConfig = ''
      Host github hub gh
        HostName github.com
        User git
    '';
  };
}
