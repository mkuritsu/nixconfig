{ config, pkgs, ... }:
{
  hardware.opentabletdriver = {
    enable = true;
    daemon.enable = true;
  };

  services.upower.enable = true;
  services.udisks2.enable = true;
  services.printing.enable = true;
  services.playerctld.enable = true;

  # https://ryjelsum.me/homelab/greetd-session-choose/
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --sessions ${config.services.displayManager.sessionData.desktops}/share/xsessions:${config.services.displayManager.sessionData.desktops}/share/wayland-sessions --remember --remember-user-session --asterisks";
        user = "greeter";
      };
    };
  };

  hardware.bluetooth.enable = true;

  xdg.mime.enable = true;
  xdg.menus.enable = true;
}
