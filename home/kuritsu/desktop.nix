{ inputs, pkgs, ... }:
{
  programs.imv = {
    enable = true;
    settings = {
      options.background = "#2b3339";
    };
  };

  xdg.configFile."hypr/hyprland.conf".source = ./hypr/hyprland.conf;

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };

  home.sessionVariables = {
    BROWSER = "chromium";
    TERMINAL = "footclient";
  };

  home.packages = [
    inputs.kushell.packages.${pkgs.system}.default
  ];
}
