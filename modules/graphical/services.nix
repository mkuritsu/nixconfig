{inputs, ...}: {
  imports = [
    inputs.nix-flatpak.nixosModules.nix-flatpak
  ];

  services = {
    upower.enable = true;
    udisks2.enable = true;
    gvfs.enable = true;
    printing.enable = true;
    playerctld.enable = true;
    gnome.gnome-keyring.enable = true;
    displayManager.gdm.enable = true;

    flatpak = {
      enable = true;
      update.auto = {
        enable = true;
        onCalendar = "daily";
      };
    };
  };

  xdg = {
    mime.enable = true;
    menus.enable = true;
  };
}
