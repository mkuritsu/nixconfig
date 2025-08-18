{
  pkgs,
  lib,
  ...
}: {
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    font = {
      name = "CaskaydiaMono Nerd Font";
      size = 11;
    };
    settings = {
      background_opacity = 0.9;
      shell = "${lib.getExe pkgs.fish}";
    };
    themeFile = "tokyo_night_night";
    keybindings = {
      "ctrl+shift+enter" = "new_window_with_cwd";
      "ctrl+shift+t" = "new_tab_with_cwd";
    };
  };
}
