{pkgs, ...}: {
  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [
    nautilus
    hyprpicker
    xwayland-satellite
    vicinae
  ];
}
