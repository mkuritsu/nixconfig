{ pkgs, ... }:
{
  hardware.opentabletdriver.enable = true;

  systemd.user.services.easyeffects = {
    unitConfig = {
      Description = "Easyeffects daemon";
      Requires = ["dbus.service"];
      After = ["graphical-session-pre.target"];
      PartOf = ["graphical-session.target" "pipewire.service"];
    };

    wantedBy = ["graphical-session.target"];

    serviceConfig = {
      ExecStart = "${pkgs.easyeffects}/bin/easyeffects --gapplication-service --load-preset BASSWAVES";
      ExecStop = "${pkgs.easyeffects}/bin/easyeffects --quit";
      Restart = "on-failure";
      RestartSec = 5;
    };
  };
}
