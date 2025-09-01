{pkgs, ...}: {
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  home.sessionVariables = {
    XCURSOR_SIZE = 24;
    XCURSOR_THEME = "catppuccin-mocha-dark-cursors";
  };

  home.packages = with pkgs; [
    catppuccin-cursors.mochaDark
    adw-gtk3
    adwaita-icon-theme
  ];
}
