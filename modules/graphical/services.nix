{ ... }:
{
  hardware = {
    bluetooth.enable = true;
    opentabletdriver = {
      enable = true;
      daemon.enable = true;
    };
  };

  services = {
    upower.enable = true;
    udisks2.enable = true;
    gvfs.enable = true;
    printing.enable = true;
    playerctld.enable = true;
    flatpak.enable = true;
    displayManager.gdm.enable = true;
    gnome.gnome-keyring.enable = true;
    fprintd.enable = true;
  };

  security.pam.services.login.enableGnomeKeyring = true;

  xdg = {
    mime.enable = true;
    menus.enable = true;
    terminal-exec.enable = true;
  };
}
