{ ... }:
{
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "tokyo-night";
      theme_background = false;
    };
    themes = {
      everforest = builtins.readFile ./btop/everforest.theme;
      tokyo-night = builtins.readFile ./btop/tokyo-night.theme;
    };
  };
}
