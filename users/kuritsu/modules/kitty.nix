{
  programs.kitty = {
    enable = true;
    font.name = "CaskaydiaMono Nerd Font";
    font.size = 11;
    themeFile = "kanagawa";
    settings = {
      background_opacity = 0.90;
      shell = "fish";
      enabled_layouts = "splits:split_axis=auto";
    };
    keybindings = {
      "ctrl+shift+enter" = "new_window_with_cwd";
      "ctrl+shift+t" = "new_tab_with_cwd";
      "ctrl+l" = "combine : clear_terminal to_cursor active : clear_terminal scrollback active";
      "ctrl+shift+n" = "launch --cwd=current --type=os-window";
    };
  };
}
