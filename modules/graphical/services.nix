{ ... }:
{
  hardware.opentabletdriver.enable = true;

  services.upower.enable = true;
  services.displayManager.ly = {
    enable = true;
    settings = {
      session_log = ".ly-session.log";
    };
  };

  xdg.mime.enable = true;
  xdg.menus.enable = true;
}
