{ inputs, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    inputs.watt.nixosModules.default
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

  services = {
    openssh.enable = true;
    watt.enable = true;
  };

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];

  system.stateVersion = "24.11";
}
