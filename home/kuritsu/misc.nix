{ ... }:
{
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };

  home.sessionVariables = {
    BROWSER = "chromium";
    TERMINAL = "footclient";
  };
}
