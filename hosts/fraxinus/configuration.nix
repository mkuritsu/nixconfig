{
  config,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./secrets.nix
    inputs.istannouncements.nixosModules.default
  ];

  boot.loader.grub.enable = false;
  boot.loader.generic-extlinux-compatible.enable = true;

  networking = {
    hostName = "fraxinus";
    useNetworkd = true;
    interfaces.end0 = {
      ipv4.addresses = [
        {
          address = "192.168.1.80";
          prefixLength = 24;
        }
      ];
    };
    defaultGateway = {
      address = "192.168.1.254";
      interface = "end0";
    };
  };

  users.users.kuritsu = {
    isNormalUser = true;
    description = "kuritsu";
    extraGroups = [
      "networkmanager"
      "wheel"
      "adbusers"
    ];
  };

  services.openssh = {
    enable = true;
    openFirewall = true;
  };

  services.istannouncements = {
    enable = true;
    openFirewall = true;
    webhook_url_file = config.age.secrets.istannouncements-webhook.path;
    username = "Penix IST";
  };

  services.tailscale = {
    enable = true;
    authKeyFile = config.age.secrets.tailscale.path;
  };

  networking.firewall.allowedTCPPorts = [6600];
  services.mpd = {
    enable = true;
    network.listenAddress = "any";
  };

  system.stateVersion = "25.11";
}
