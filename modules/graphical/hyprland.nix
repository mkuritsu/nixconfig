{ pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  services.hypridle.enable = true;
  programs.hyprlock.enable = true;

  # fix dolphin not showing apps
  environment.etc."/xdg/menus/applications.menu".text =
    builtins.readFile "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";

  environment.systemPackages = with pkgs; [
    kdePackages.dolphin
    kdePackages.okular
    kdePackages.ark
    kdePackages.gwenview
    kdePackages.kdegraphics-thumbnailers
    kdePackages.qtsvg
    kdePackages.ffmpegthumbs
    kdePackages.qtstyleplugin-kvantum
    kdePackages.qt6ct

    grim
    slurp
    wf-recorder
    hyprpicker
  ];
}
