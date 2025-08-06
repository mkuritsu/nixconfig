{pkgs, ...}: {
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    autoPrune.enable = true;
  };

  environment.systemPackages = with pkgs; [
    podman-compose
  ];

  systemd.services.NetworkManager-wait-online.enable = false;
}
