{ pkgs, ... }:
let
  qt-theme-name = "catppuccin-mocha-mauve";
in
{
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  xdg.configFile."Kvantum/${qt-theme-name}".source = ./kvantum;
  xdg.configFile."Kvantum/kvantum.kvconfig".text = ''
    [General]
    theme=${qt-theme-name}
  '';

  qt = {
    enable = true;
    platformTheme.name = "qt5ct";
    #style.name = "kvantum";
  };

  gtk = {
    enable = true;
    theme = {
      name = "rose-pine";
      package = pkgs.rose-pine-gtk-theme;
    };
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
    gtk3.bookmarks = [
      "file:///home/kuritsu/Documents"
      "file:///home/kuritsu/Music"
      "file:///home/kuritsu/Pictures"
      "file:///home/kuritsu/Videos"
      "file:///home/kuritsu/Downloads"
    ];
  };
}
