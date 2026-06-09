{
  imports = [
    ./hardware-configuration.nix
    ./secrets.nix
    ./services/acoustic-bot.nix
    ./services/caddy.nix
    ./services/filebrowser.nix
    ./services/forgejo.nix
    ./services/glance.nix
    ./services/openssh.nix
    ./services/tailscale.nix
  ];

  boot = {
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
      timeout = 0;
    };
  };

  networking = {
    defaultGateway = "192.168.1.1";
    interfaces.end0 = {
      ipv4.addresses = [
        {
          address = "192.168.1.80";
          prefixLength = 24;
        }
      ];
    };
  };

  system.autoUpgrade = {
    enable = true;
    flake = "github:mkuritsu/nixconfig";
    dates = "05:00";
    allowReboot = true;
    rebootWindow = {
      lower = "04:00";
      upper = "06:00";
    };
  };

  system.stateVersion = "24.11";
}
