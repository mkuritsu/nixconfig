{ config, pkgs, ... }:
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

  # User
  users.users.kuritsu = {
    isNormalUser = true;
    description = "kuritsu";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    shell = pkgs.zsh;
  };

  # Programs
  programs = {
    gamescope.enable = true;
    gamemode.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      gamescopeSession.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    # system utilities
    wget
    git
    fastfetch
    onefetch
    mangohud
    btop
    htop
    gdb
    valgrind
    nvidia-vaapi-driver
    tmux
    fzf
    ueberzugpp
    bubblewrap

    # basic apps
    papers
    mpv
    nautilus
    loupe
    gnome-calendar
    thunderbird
    rnote
    gnome-text-editor
    file-roller

    # apps
    spotify
    vesktop
    vscode
    android-studio
    obs-studio
    heroic
    prismlauncher
    osu-lazer-bin

    # for hyprland
    grim
    slurp
    dunst
    wofi
    wl-clipboard
    wf-recorder
    waybar
    pavucontrol
    hyprpaper
    hypridle
    hyprlock
    hyprpicker
    hyprpolkitagent
  ];

  system.stateVersion = "24.11";
}
