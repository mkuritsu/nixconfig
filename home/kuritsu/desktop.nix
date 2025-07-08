{ inputs, ... }:
{
  imports = [
    inputs.kushell.homeModules.kushell
  ];

  programs.kushell.enable = true;

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
}
