{...}: {
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "tokyo-night";
      theme_background = false;
      update_ms = 300;
    };
    themes = {
      everforest = builtins.readFile ./btop/everforest.theme;
      tokyo-night = builtins.readFile ./btop/tokyo-night.theme;
    };
  };
}
