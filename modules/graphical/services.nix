{
  pkgs,
  ...
}:
{
  hardware.opentabletdriver = {
    enable = true;
    daemon.enable = true;
  };

  services.upower.enable = true;
  services.udisks2.enable = true;
  services.gvfs.enable = true;
  services.printing.enable = true;
  services.playerctld.enable = true;
  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  hardware.bluetooth.enable = true;

  xdg.mime.enable = true;
  xdg.menus.enable = true;
}
