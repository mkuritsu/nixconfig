{...}: {
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    font = {
      name = "CaskaydiaMono Nerd Font Mono";
      size = 11;
    };
    settings.background_opacity = 0.90;
    themeFile = "tokyo_night_night";
    keybindings = {
      "ctrl+shift+enter" = "new_window_with_cwd";
      "ctrl+shift+t" = "new_tab_with_cwd";
    };
  };
}
