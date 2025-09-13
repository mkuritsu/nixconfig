{ ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking = {
    wireless.iwd.enable = true;
    networkmanager.enable = true;
    networkmanager.dns = "none";
    networkmanager.wifi.backend = "iwd";
  };

  services.thermald.enable = true;

  services.openssh.enable = true;

  system.stateVersion = "24.11";
}
