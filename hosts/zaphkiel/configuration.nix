{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    binfmt.emulatedSystems = [ "aarch64-linux" ];
  };

  # networking = {
  #   interfaces.enp34s0 = {
  #     ipv4.addresses = [
  #       {
  #         address = "192.168.1.70";
  #         prefixLength = 24;
  #       }
  #     ];
  #   };
  #   defaultGateway = {
  #     address = "192.168.1.254";
  #     interface = "enp34s0";
  #   };
  # };

  networking.networkmanager = {
    enable = true;
    dns = "none";
    plugins = with pkgs; [
      networkmanager-strongswan
      networkmanager-openvpn
    ];
  };

  services.openssh = {
    enable = true;
    openFirewall = true;
    settings.PasswordAuthentication = false;
  };

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];

  system.stateVersion = "24.11";
}
