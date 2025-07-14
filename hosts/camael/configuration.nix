{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  # Networking
  networking = {
    hostName = "camael";
    wireless.iwd.enable = true;
    networkmanager.enable = true;
    networkmanager.dns = "none";
    networkmanager.wifi.backend = "iwd";
  };

  services.thermald.enable = true;

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];

  system.stateVersion = "24.11";
}
