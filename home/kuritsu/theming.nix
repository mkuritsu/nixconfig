{pkgs, ...}: {
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
  home.file.".config/Kvantum/Tokyonight".source = ./qt/themes/Tokyonight;
  home.file.".config/Kvantum/kvantum.kvconfig".text = ''
    [General]
    theme=Tokyonight
  '';
  home.file.".config/qt6ct/qt6ct.conf".source = ./qt/qt6ct.conf;

  gtk = {
    enable = true;
    theme = {
      package = pkgs.tokyonight-gtk-theme;
      name = "Tokyonight-Dark";
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
