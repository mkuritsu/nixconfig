{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  # Networking
  networking = {
    hostName = "asuka";
    firewall = {
      enable = true;
      allowedTCPPorts = [ ];
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
    tmux
    fzf
    ueberzugpp

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
