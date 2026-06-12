{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.dms.homeModules.default
  ];

  programs.dank-material-shell = {
    enable = true;
  };

  home.pointerCursor = {
    package = pkgs.adwaita-icon-theme;
    name = "Adwaita";
    size = 24;

    gtk.enable = true;
    x11.enable = true;
  };

  home.packages = [
    pkgs.kdePackages.qt6ct
  ];

  gtk = {
    enable = true;
    gtk3.theme = {
      name = "adw-gtk3";
      package = pkgs.adw-gtk3;
    };
  };
}
