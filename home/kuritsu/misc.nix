{ ... }:
{
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };

  home.sessionVariables = {
    BROWSER = "firefox";
    TERMINAL = "footclient";
  };
}
