{
  config,
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./secrets.nix
    inputs.istannouncements.nixosModules.default
  ];

  boot = {
    loader.grub.enable = false;
    loader.generic-extlinux-compatible.enable = true;
    loader.timeout = 0;
    kernelPackages = pkgs.linuxPackages_latest;
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

  services.openssh = {
    enable = true;
    openFirewall = true;
    settings.PasswordAuthentication = false;
  };

  services.istannouncements = {
    enable = true;
    openFirewall = true;
    webhook_url = "https://discord.com/api/webhooks/1280486123726176286/YsKHoRdK9bLIiAjLUf1zqgRs-d6IGiD5H63H7iDMwbjmM94KfgQPoHYvwW090PwJ2a6k";
    username = "Penix IST";
  };

  services.tailscale = {
    enable = true;
    authKeyFile = config.age.secrets.tailscale.path;
  };

  networking.firewall.allowedTCPPorts = [
    8080
  ];

  system.stateVersion = "25.11";
}
