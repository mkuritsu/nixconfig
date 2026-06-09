{
  inputs,
  ...
}: {
  imports = [
    inputs.nix-flatpak.nixosModules.nix-flatpak
  ];

  services = {
    upower.enable = true;
    udisks2.enable = true;
    gvfs.enable = true;
    printing.enable = true;
    playerctld.enable = true;
    displayManager.cosmic-greeter.enable = true;
    gnome.gnome-keyring.enable = true;

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
