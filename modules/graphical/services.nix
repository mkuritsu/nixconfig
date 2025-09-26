{ config, pkgs, ... }:
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
  };

  # https://ryjelsum.me/homelab/greetd-session-choose/
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --sessions ${config.services.displayManager.sessionData.desktops}/share/wayland-sessions --remember --remember-user-session --asterisks";
        user = "greeter";
      };
    };
  };

  xdg = {
    mime.enable = true;
    menus.enable = true;
    terminal-exec.enable = true;
  };
}
