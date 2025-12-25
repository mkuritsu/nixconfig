{pkgs, ...}: {
  environment.etc."/xdg/menus/applications.menu".text =
    builtins.readFile "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";

  services.gnome.gnome-keyring.enable = true;

  environment.systemPackages = with pkgs; [
    brightnessctl
    gpu-screen-recorder
    hyprpicker
    kitty
    ghostty
    matugen
    mpv
    imv
    kdePackages.okular
    kdePackages.dolphin
    kdePackages.kio-extras
    kdePackages.ark
    kdePackages.ffmpegthumbs
    kdePackages.kdegraphics-thumbnailers
    kdePackages.gwenview
    swappy
  ];
}
