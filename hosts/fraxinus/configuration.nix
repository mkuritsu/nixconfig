{config, ...}: {
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

    filebrowser = {
      enable = true;
      settings.port = 8081;
    };

    forgejo = {
      enable = true;
      database.type = "sqlite3";
      settings = {
        server = {
          DOMAIN = "git.fraxinus.local";
          ROOT_URL = "http://git.fraxinus.local";
          HTTP_ADDR = "127.0.0.1";
          HTTP_PORT = 3000;
        };
      };
    };

    glance = {
      enable = true;
      settings = {
        pages = [
          {
            name = "Dashboard";
            columns = [
              {
                size = "full";
                widgets = [
                  {
                    type = "monitor";
                    cache = "1m";
                    title = "Services";
                    sites = [
                      {
                        title = "Git";
                        url = "http://127.0.0.1:3000";
                      }
                      {
                        title = "Storage";
                        url = "http://127.0.0.1:8081";
                      }
                    ];
                  }
                ];
              }
            ];
          }
        ];
      };
    };

    caddy = {
      enable = true;
      openFirewall = true;
      virtualHosts = {
        "fraxinus.local".extraConfig = ''reverse_proxy 127.0.0.1:8080'';
        "git.fraxinus.local".extraConfig = ''reverse_proxy 127.0.0.1:3000'';
        "files.fraxinus.local".extraConfig = ''reverse_proxy 127.0.0.1:8081'';
      };
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

  system.stateVersion = "25.11";
}
