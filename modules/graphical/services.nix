{ ... }:
{
  hardware.opentabletdriver.enable = true;

  services.upower.enable = true;
  services.udisks2.enable = true;
  services.gvfs.enable = true;
  services.printing.enable = true;
  services.displayManager.ly = {
    enable = true;
    settings = {
      session_log = ".ly-session.log";
    };
  };

  hardware.bluetooth.enable = true;

  xdg.mime.enable = true;
  xdg.menus.enable = true;
}
