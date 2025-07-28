{...}: {
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  systemd.services.NetworkManager-wait-online.enable = false;
}
