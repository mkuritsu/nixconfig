{
  pkgs,
  ...
}:
{
  hardware.opentabletdriver = {
    enable = true;
    daemon.enable = true;
  };
  hardware.bluetooth.enable = true;

  services = {
    upower.enable = true;
    udisks2.enable = true;
    gvfs.enable = true;
    printing.enable = true;
    playerctld.enable = true;
    flatpak.enable = true;
    displayManager.gdm.enable = true;
    gnome.gnome-keyring.enable = true;
  };

  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };

  security.pam.services.login.enableGnomeKeyring = true;

  xdg = {
    mime.enable = true;
    menus.enable = true;
    terminal-exec.enable = true;
  };
}
