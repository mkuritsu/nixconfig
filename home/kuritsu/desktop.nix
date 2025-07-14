{ inputs, pkgs, ... }:
{
  imports = [
    inputs.kushell.homeModules.kushell
  ];

  programs.kushell = {
    enable = true;
    package = (
      inputs.quickshell.packages.${pkgs.system}.default.override {
        withX11 = false;
        withPam = false;
        withI3 = false;
      }
    );
  };

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
}
