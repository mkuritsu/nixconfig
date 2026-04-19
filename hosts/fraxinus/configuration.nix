{
  config,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./secrets.nix
  ];

  boot = {
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
      timeout = 0;
    };
  };

  networking = {
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

  services = {
    openssh = {
      enable = true;
      openFirewall = true;
      # settings.PasswordAuthentication = false;
    };

    tailscale = {
      enable = true;
      authKeyFile = config.age.secrets.tailscale.path;
    };
  };

  networking.firewall.allowedTCPPorts = [
    8001
  ];

  system.autoUpgrade = {
    enable = true;
    flake = "github:mkuritsu/nixconfig";
    dates = "05:00";
    allowReboot = true;
  };

  system.stateVersion = "25.11";
}
