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
  
  nix.settings.experimental-features = ["nix-command" "flakes"];

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Lisbon";

  # Select internationalisation properties.
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

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.desktopManager.xterm.enable = false;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "altgr-intl";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
  
  # nvidia
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.latest;
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = false;
  };
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
  services.xserver.videoDrivers = ["nvidia"];

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kuritsu = {
    isNormalUser = true;
    description = "kuritsu";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Install firefox.
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
  
  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };

  hardware.opentabletdriver.enable = true;
  services.flatpak.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  virtualisation.docker.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # system utilities
    vim
    wget
    git
    fastfetch
    onefetch
    mangohud

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
    pkgs-unstable.rust.packages.stable.rustPlatform.rustcSrc
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

    # unstable packages
    pkgs-unstable.osu-lazer-bin
  ];
  
  environment.gnome.excludePackages = with pkgs; [
    geary
    totem
    gnome-music
  ];
  
  fileSystems."/mnt/ssd2" = {
    label = "ssd2";
    fsType = "ext4";
    device = "/dev/disk/by-uuid/a6d24f19-006f-4fbd-9c68-12fd207bca62";
    options = [
      "nofail"
      "x-gvfs-show"
    ];
  };
  
  fileSystems."/mnt/hdd" = {
    label = "hdd";
    fsType = "btrfs";
    device = "/dev/disk/by-uuid/78992061-e44e-47c4-bcb9-fc2935b5d710";
    options = [
      "nofail"
      "x-gvfs-show"
    ];
  };
  
  services.gvfs.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
