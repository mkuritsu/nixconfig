{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.displayManager.ly.enable = true;

  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "altgr-intl";
    };
    excludePackages = [ pkgs.xterm ];
  };

  # Nix settings
  nixpkgs.config.allowUnfree = true;
  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
    optimise.automatic = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

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
    nameservers = [ "1.1.1.1" "8.8.8.8" ];
    interfaces.enp34s0 = {
      useDHCP = false;
      ipv4.addresses = [{
        address = "192.168.1.70";
        prefixLength = 24;
      }];
      ipv6.addresses = [{
        address = "fd00::70";
        prefixLength = 64;
      }];
    };
  };

  # Localization
  time.timeZone = "Europe/Lisbon";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Graphics
  services.xserver.videoDrivers = [
    "modesetting"
    "nvidia"
  ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = false;
  };
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Audio
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = false;
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
    zsh.enable = true;
    firefox.enable = true;
    gamescope.enable = true;
    gamemode.enable = true;
    hyprland = {
      enable = true;
    };
    vim = {
      enable = true;
      defaultEditor = true;
    };
    neovim.enable = true;
    foot = {
      enable = true;
      enableZshIntegration = false;
    };
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      gamescopeSession.enable = true;
    };
    nix-ld.enable = true;
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

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

  # Misc
  virtualisation.docker.enable = true;
  hardware.opentabletdriver.enable = true;
  services.printing.enable = true;
  services.gvfs.enable = true;

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-emoji
    font-awesome
    jetbrains-mono
    dejavu_fonts
    cantarell-fonts
    nerd-fonts.jetbrains-mono
  ];

  system.stateVersion = "24.11";
}
