{
  inputs,
  pkgs,
  ...
}: {
  environment.etc."/xdg/menus/applications.menu".text =
    builtins.readFile "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";

  services.gnome.gnome-keyring.enable = true;

  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

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
    nautilus
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
