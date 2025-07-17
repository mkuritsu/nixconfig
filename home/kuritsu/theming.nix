{ pkgs, ... }:
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

  home.file.".config/Kvantum/Everforest".source = ./qt/themes/Everforest;
  home.file.".config/Kvantum/kvantum.kvconfig".text = ''
    [General]
    theme=Everforest
  '';
  home.file.".config/qt6ct/qt6ct.conf".source = ./qt/qt6ct.conf;

  qt = {
    enable = true;
    platformTheme.name = "qt6ct";
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.rose-pine-gtk-theme;
      name = "rose-pine";
    };
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
