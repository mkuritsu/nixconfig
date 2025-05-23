{ pkgs, ... }:
{
  programs = {
    firefox.enable = true;
    hyprland.enable = true;
    foot = {
      enable = true;
      enableZshIntegration = false;
    };
  };

  environment.systemPackages = with pkgs; [
    # programs
    papers
    mpv
    nautilus
    loupe
    gnome-calendar
    thunderbird
    rnote
    gnome-text-editor
    file-roller
    spotify
    vesktop
    vscode
    android-studio

    # for hyprland
    grim
    slurp
    dunst
    wofi
    wf-recorder
    waybar
    pavucontrol
    hyprpaper
    hypridle
    hyprlock
    hyprpicker
    hyprpolkitagent
  ];
}
