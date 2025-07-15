{ ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

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

  services.openssh = {
    enable = true;
    openFirewall = true;
  };

  system.stateVersion = "24.11";
}
