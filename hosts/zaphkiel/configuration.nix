{ config, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking = {
    hostName = "zaphkiel";
    useNetworkd = true;
    interfaces.enp34s0 = {
      ipv4.addresses = [
        {
          address = "192.168.1.70";
          prefixLength = 24;
        }
      ];
    };
    defaultGateway = {
      address = "192.168.1.254";
      interface = "enp34s0";
    };
  };

  programs.coolercontrol.enable = true;

  services.openssh = {
    enable = true;
    openFirewall = true;
  };

  services.tailscale = {
    enable = true;
    openFirewall = true;
    authKeyFile = config.age.secrets.zaphkiel-tailscale.path;
  };

  system.stateVersion = "24.11";
}
