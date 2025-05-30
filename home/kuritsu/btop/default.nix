{ ... }:
{
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "catppuccin_mocha";
      theme_background = false;
    };
    themes = {
      catppuccin_mocha = builtins.readFile ./catppuccin_mocha.theme;
    };
  };
}
