# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, pkgs-unstable, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs-unstable.linuxPackages_latest;
  
  # Nix settings
  nix.optimise.automatic = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

  # Networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

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

  # Services
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager = {
      gnome.enable = true;
      xterm.enable = false;
    };
    xkb = {
      layout = "us";
      variant = "altgr-intl";
    };
  };
  services.printing.enable = true;
  services.xserver.videoDrivers = ["nvidia"];
  services.flatpak.enable = true;
  services.gvfs.enable = true;
  
  # hardware
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.latest;
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
  hardware.opentabletdriver.enable = true;

  # Sound
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # User
  users.users.kuritsu = {
    isNormalUser = true;
    description = "kuritsu";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
    ];
  };

  # Programs
  programs.firefox.enable = true;
  programs.gamescope.enable = true;
  programs.gamemode.enable = true;
  programs.java.enable = true;
  programs.direnv.enable = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    gamescopeSession.enable = true;
    package = pkgs.steam.override {
      extraPkgs = pkgs: [
        pkgs.gtk4
        pkgs.adwaita-icon-theme
      ];
    };
  };

  # Setup environment
  environment.systemPackages = with pkgs; [
    # system utilities
    vim
    wget
    git
    fastfetch
    onefetch
    mangohud
    btop
    vaapiVdpau
    libvdpau-va-gl

    # dev
    pkgs-unstable.clang
    pkgs-unstable.clang-tools
    pkgs-unstable.cmake
    pkgs-unstable.ninja
    pkgs-unstable.python3
    pkgs-unstable.jdk
    pkgs-unstable.gcc
    pkgs-unstable.gnumake
    pkgs-unstable.gdb
    pkgs-unstable.valgrind
    pkgs-unstable.nodejs
    pkgs-unstable.rustc
    pkgs-unstable.cargo
    pkgs-unstable.rustfmt
    pkgs-unstable.maven
    pkgs-unstable.gradle
    pkgs-unstable.meson

    # apps
    papers
    showtime
    decibels
    vesktop
    gnome-tweaks
    gnome-shell-extensions
    vscode-fhs
    heroic
    prismlauncher
    thunderbird
    chromium
    pkgs-unstable.osu-lazer-bin
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  
  environment.gnome.excludePackages = with pkgs; [
    geary
    totem
    gnome-music
  ];

  # Misc
  virtualisation.docker.enable = true;

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };

  system.stateVersion = "24.11";
}
