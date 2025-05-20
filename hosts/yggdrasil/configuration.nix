{ ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  # Networking
  networking = {
    hostName = "yggdrasil";
    useDHCP = false;
    firewall = {
      enable = true;
      allowedTCPPorts = [
        5555 # adb
      ];
      extraCommands = ''
        iptables -A nixos-fw -p tcp --source 192.168.1.0/24 -j nixos-fw-accept
        iptables -A nixos-fw -p udp --source 192.168.1.0/24 -j nixos-fw-accept
      '';
    };
    defaultGateway = "192.168.1.254";
    nameservers = [
      "1.1.1.1"
      "8.8.8.8"
    ];
    interfaces.enp34s0 = {
      useDHCP = false;
      ipv4.addresses = [
        {
          address = "192.168.1.70";
          prefixLength = 24;
        }
      ];
      ipv6.addresses = [
        {
          address = "fd00::70";
          prefixLength = 64;
        }
      ];
    };
  };

  programs = {
    coolercontrol.enable = true;
  };

  system.stateVersion = "24.11";
}
