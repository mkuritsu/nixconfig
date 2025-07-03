{ ... }:
{
  virtualisation.docker.enable = true;

  services.printing.enable = true;

  hardware.bluetooth.enable = true;

  systemd.services.NetworkManager-wait-online.enable = false;
}
