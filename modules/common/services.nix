{ ... }:
{
  virtualisation.docker.enable = true;

  services.printing.enable = true;

  services.gvfs.enable = true;

  hardware.bluetooth.enable = true;

  boot.plymouth.enable = true;
}
