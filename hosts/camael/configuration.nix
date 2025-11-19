{ inputs, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    inputs.watt.nixosModules.default
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 0;
    };
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
  };

  networking.networkmanager = {
    enable = true;
    dns = "none";
    plugins = with pkgs; [
      networkmanager-openvpn
      networkmanager-strongswan
    ];
    wifi = {
      powersave = true;
      macAddress = "random";
      scanRandMacAddress = true;
    };
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
