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
    grim
    slurp
    wf-recorder
    hyprpicker
    hyprshot
    hyprpolkitagent
  ];
}
