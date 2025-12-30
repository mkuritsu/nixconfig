{pkgs, ...}: let
  kvantum-theme = pkgs.catppuccin-kvantum.override {
    variant = "mocha";
    accent = "blue";
  };

  kde-theme = pkgs.catppuccin-kde.override {
    flavour = ["mocha"];
    accents = ["blue"];
  };
in {
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  xdg.configFile = {
    "qt6ct/qt6ct.conf".source = ../dots/qt6ct/qt6ct.conf;
    "qt6ct/colors/Catppuccin-Mocha.conf".source = "${pkgs.catppuccin-qt5ct}/themes/Catppuccin-Mocha.conf";

    "kdeglobals".text = (builtins.readFile ../dots/kdeglobals) + (builtins.readFile ''${kde-theme}/share/color-schemes/CatppuccinMochaBlue.colors'');

    "Kvantum/catppuccin-mocha-blue".source = "${kvantum-theme}/share/Kvantum/catppuccin-mocha-blue";
    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=catppuccin-mocha-blue
    '';
  };

  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    package = pkgs.catppuccin-cursors.mochaDark;
    name = "catppuccin-mocha-dark-cursors";
    size = 24;
  };

  gtk = {
    enable = true;
    gtk2.enable = false;
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
    gtk3 = {
      theme = {
        name = "adw-gtk3-dark";
        package = pkgs.adw-gtk3;
      };
      bookmarks = [
        "file:///home/kuritsu/Documents"
        "file:///home/kuritsu/Downloads"
        "file:///home/kuritsu/Music"
        "file:///home/kuritsu/Pictures"
        "file:///home/kuritsu/Videos"
      ];
    };
  };
}
