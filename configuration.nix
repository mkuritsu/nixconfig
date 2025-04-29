# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  pkgs-unstable,
  options,
  ...
}:
{
  imports = [
    # Include the results of the hardware scan.
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
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
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
    xkb = {
      layout = "us";
      variant = "altgr-intl";
    };
    excludePackages = [ pkgs.xterm ];
  };
  services.printing.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
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
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    shell = pkgs.zsh;
    packages = with pkgs; [ ];
  };

  # Programs
  programs.zsh.enable = true;
  programs.firefox.enable = true;
  programs.gamescope.enable = true;
  programs.gamemode.enable = true;
  programs.java.enable = true;
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };
  programs.vim = {
    enable = true;
    defaultEditor = true;
  };
  programs.neovim.enable = true;
  programs.foot = {
    enable = true;
    enableZshIntegration = false;
  };
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
  programs.nix-ld.enable = true;

  # Setup environment
  environment.systemPackages = with pkgs; [
    # system utilities
    wget
    git
    fastfetch
    onefetch
    mangohud
    btop
    htop
    nvidia-vaapi-driver
    python3
    gdb
    valgrind

    # apps
    okular
    papers
    mpv
    nautilus
    heroic
    prismlauncher
    thunderbird
    chromium
    vscodium
    android-studio
    ghostty
    spotify
    vesktop
    discord
    pkgs-unstable.osu-lazer-bin

    # for hyprland
    grim
    slurp
    dunst
    wofi
    wl-clipboard
    waybar
    hyprpaper
    hypridle
    hyprlock
    hyprpicker
  ];

  # Misc
  virtualisation.docker.enable = true;

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    font-awesome
    jetbrains-mono
    nerdfonts
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  system.stateVersion = "24.11";
}
