{
  config,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
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
    username = "Penix IST";
    # agenix says to not do this but this isn't a sensitive secret, its only encrypted to avoid potential spam in the discord channel by unauthorized parties
    # since my nxiconfig is public in github, with that this getting put in plain text inside the nix store is fine
    # webhook_url = builtins.readFile config.age.secrets.istannouncements-webhook.path;
  };

  system.stateVersion = "25.11";
}
