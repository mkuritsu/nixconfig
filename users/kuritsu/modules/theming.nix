{ config, pkgs, ... }:
let
  kde-theme = pkgs.catppuccin-kde.override {
    flavour = [ "mocha" ];
    accents = [ "blue" ];
  };

  kvantum-theme = pkgs.catppuccin-kvantum.override {
    variant = "mocha";
    accent = "blue";
  };
in
{
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    package = pkgs.catppuccin-cursors.mochaDark;
    name = "catppuccin-mocha-dark-cursors";
    size = 24;
  };

  qt = {
    enable = true;
    style.package = with pkgs; [
      kdePackages.qtstyleplugin-kvantum
      darkly
    ];
    style.name = "kvantum";
    platformTheme.name = "qtct";
  };

  xdg.configFile = {
    "qt6ct/colors/Catppuccin-Mocha.conf".source =
      "${pkgs.catppuccin-qt5ct}/themes/Catppuccin-Mocha.conf";

    "qt6ct/qt6ct.conf".source = pkgs.substitute {
      src = ../dots/qt6ct/qt6ct.conf;
      substitutions = [
        "--replace-fail"
        "##COLORSCHEME##"
        "/home/${config.home.username}/.config/qt6ct/colors/Catppuccin-Mocha.conf"
      ];
    };

    "kdeglobals".text =
      (builtins.readFile ../dots/kdeglobals)
      + (builtins.readFile ''${kde-theme}/share/color-schemes/CatppuccinMochaBlue.colors'');

    "Kvantum/catppuccin-mocha-blue".source = "${kvantum-theme}/share/Kvantum/catppuccin-mocha-blue";
    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=catppuccin-mocha-blue
    '';
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
