{pkgs, ...}: {
  systemd.timers.podman-auto-update = {
    wantedBy = ["timers.target"];
    timerConfig = {
      OnCalendar = "daily";
      Persistent = true;
    };
  };

  systemd.services.podman-auto-update = {
    serviceConfig = {
      Type = "oneshot";
    };
    script = "${pkgs.podman}/bin/podman auto-update";
  };
}
