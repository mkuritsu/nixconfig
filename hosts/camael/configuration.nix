{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.networkmanager = {
    enable = true;
    dns = "none";
    plugins = with pkgs; [
      networkmanager-strongswan
    ];
  };

  services.thermald.enable = true;

  services.openssh.enable = true;

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];

  system.stateVersion = "24.11";
}
