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
    settings.PasswordAuthentication = false;
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

  networking.firewall.allowedTCPPorts = [53 80 8080];
  networking.firewall.allowedUDPPorts = [53 67 547];

  services.nginx = {
    enable = true;
    virtualHosts."192.168.1.80" = {
      listen = [
        {
          addr = "0.0.0.0";
          port = 80;
        }
      ];

      locations = {
        "/pihole" = {
          proxyPass = "http://192.168.1.80:8080/admin";
          proxyWebsockets = true;
        };

        "/istannouncements" = {
          proxyPass = "http://192.168.1.80:8000";
          proxyWebsockets = true;
        };
      };
    };
  };

  system.stateVersion = "25.11";
}
