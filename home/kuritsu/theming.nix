{ pkgs, ... }:
let
  qt-theme-name = "Everforest";
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

  home.file.".config/Kvantum/${qt-theme-name}".source = ./kvantum;
  home.file.".config/Kvantum/kvantum.kvconfig".text = ''
    [General]
    theme=${qt-theme-name}
  '';

  qt = {
    enable = true;
    platformTheme.name = "qt6ct";
  };

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
    gtk3.bookmarks = [
      "file:///home/kuritsu/Documents"
      "file:///home/kuritsu/Downloads"
      "file:///home/kuritsu/Music"
      "file:///home/kuritsu/Pictures"
      "file:///home/kuritsu/Videos"
    ];
  };
}
