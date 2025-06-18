{
  self,
  pkgs,
  inputs,
  ...
}:
{

  programs.hyprland.enable = true;

  environment.etc."/xdg/menus/applications.menu".text =
    builtins.readFile "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";

  environment.systemPackages = with pkgs; [
    kdePackages.dolphin
    kdePackages.kdegraphics-thumbnailers
    kdePackages.qtwayland
    kdePackages.okular
    kdePackages.kate
    kdePackages.ark
    kdePackages.gwenview
    kdePackages.qtmultimedia

    grim
    slurp
    wf-recorder
    hypridle
    hyprlock
    hyprpicker
    hyprpolkitagent
    self.packages.${pkgs.system}.hyprpaper-switcher
    (inputs.quickshell.packages.${pkgs.system}.default.override {
      withJemalloc = true;
      withQtSvg = true;
      withWayland = true;
      withX11 = true;
      withPipewire = true;
      withPam = true;
      withHyprland = true;
    })
  ];
}
