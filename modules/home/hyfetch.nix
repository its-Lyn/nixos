{
  programs.hyfetch = {
    enable = true;

    settings = {
      preset = "transgender";
      mode   = "rgb";

      light_dark = "dark";
      lightness  = 0.65;

      color_align = {
        mode = "horizontal";
      };

      backend = "neofetch";
      distro  = null;

      pride_month_shown   = [];
      pride_month_disable = false;
    };
  };
}
