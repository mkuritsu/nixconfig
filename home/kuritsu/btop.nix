{ ... }:
{
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "everforest";
      theme_background = false;
    };
    themes = {
      everforest = builtins.readFile ./btop/everforest.theme;
    };
  };
}
