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

  home.packages = with pkgs; [
    kdePackages.qtstyleplugin-kvantum
    kdePackages.qt6ct
  ];

  xdg.configFile."Kvantum/${qt-theme-name}".source = ./qt-theme;

  xdg.configFile."Kvantum/kvantum.kvconfig".text = ''
    [General]
    theme=${qt-theme-name}
  '';

  qt = {
    enable = true;
    platformTheme.name = "qtct";
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
