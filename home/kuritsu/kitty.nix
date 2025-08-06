{...}: {
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    font = {
      name = "CaskaydiaMono Nerd Font";
      size = 11;
    };
    settings = {
      background_opacity = 0.9;
    };
    themeFile = "tokyo_night_night";
    keybindings = {
      "ctrl+shift+enter" = "new_window_with_cwd";
      "ctrl+shift+t" = "new_tab_with_cwd";
    };
  };
}
