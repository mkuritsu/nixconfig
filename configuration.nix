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
  nix.gc = {
    automatic = true;
    persistent = false;
    dates = "daily";
    options = "--delete-older-than 30d";
  };
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
    };
    xkb = {
      layout = "us";
      variant = "altgr-intl";
    };
    excludePackages = [ pkgs.xterm ];
  };
  services.printing.enable = true;
  services.xserver.videoDrivers = ["nvidia"];
  services.flatpak.enable = true;
  services.gvfs.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;
  
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
    shell = pkgs.zsh;
    packages = with pkgs; [
    ];
  };

  # Programs
  programs.zsh.enable = true;
  programs.firefox.enable = true;
  programs.gamescope.enable = true;
  programs.gamemode.enable = true;
  programs.java.enable = true;
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
  programs.chromium = {
    enable = true;
    extensions = [
      "nngceckbapebfimnlniiiahkandclblb" # bitwarden
      "pkehgijcmpdhfbdbbnkijodmdjhbjlgp" # privact badger
      "gebbhagfogifgggkldgodflihgfeippi" # return youtube dislike
      "mnjggcdmjocbbbhaepdhchncahnbgone" # sponsor block
      "ddkjiahejlhfcafbddmgiahcphecmpfh" # ublock origin lite
      "kehjfphhkfppnnjhdfhanmehkegdppho" # youtube row fixer
    ];
  };

  # Setup environment
  environment.systemPackages = with pkgs; [
    # system utilities
    vim
    neovim
    wget
    git
    fastfetch
    onefetch
    mangohud
    btop
    vaapiVdpau
    libvdpau-va-gl
    python3
    gdb
    valgrind

    # apps
    papers
    showtime
    decibels
    vesktop
    gnome-tweaks
    gnome-shell-extensions
    gnome-extension-manager
    heroic
    prismlauncher
    thunderbird
    chromium
    vscode
    pkgs-unstable.osu-lazer-bin
  ];
  
  environment.gnome.excludePackages = with pkgs; [
    geary
    totem
    gnome-music
    gnome-tour
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
