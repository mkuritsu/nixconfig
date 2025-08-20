{pkgs, ...}: {
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  home.pointerCursor = {
    enable = true;
    hyprcursor.enable = true;
    x11.enable = true;
    gtk.enable = true;
    package = pkgs.catppuccin-cursors.mochaDark;
    name = "Catppuccin-Mocha-Dark-Cursors";
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
    gtk3.theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
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
