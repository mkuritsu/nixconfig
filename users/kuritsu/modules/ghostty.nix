{
  programs.ghostty = {
    enable = true;
    systemd.enable = true;
    settings = {
      command = "fish";
      theme = "Everforest Dark Hard";
      font-family = "CaskaydiaMono Nerd Font";
      font-size = 12;
      gtk-wide-tabs = false;
      gtk-single-instance = true;
      quit-after-last-window-closed = false;
      background-opacity = 0.9;
    };
  };
}
