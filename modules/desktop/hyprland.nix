{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.hyprland.nixosModules.default
  ];

  environment.etc."/xdg/menus/applications.menu".text =
    builtins.readFile "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";

  services.gnome.gnome-keyring.enable = true;

  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    brightnessctl
    gpu-screen-recorder
    matugen
    mpv
    kdePackages.okular
    kdePackages.dolphin
    kdePackages.kio-extras
    kdePackages.ark
    kdePackages.ffmpegthumbs
    kdePackages.kdegraphics-thumbnailers
    kdePackages.gwenview
    swappy
    ghostty
    imv
    zathura
    grim
    slurp
    grimblast
    app2unit
    uwsm

    hyprpolkitagent
    hyprpicker
  ];
}
