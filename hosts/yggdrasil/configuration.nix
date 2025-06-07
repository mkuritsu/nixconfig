{ ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  # Networking
  networking = {
    hostName = "yggdrasil";
    networkmanager.enable = true;
    networkmanager.dns = "none";
    useDHCP = false;
    dhcpcd.enable = false;
    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
      "8.8.8.8"
      "8.8.4.4"
    ];
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
  };

  programs = {
    coolercontrol.enable = true;
  };

  system.stateVersion = "24.11";
}
