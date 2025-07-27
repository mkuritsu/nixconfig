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

  # changes the terminal that dolphin uses
  home.file.".config/kdeglobals".text = ''
    [General]
    TerminalApplication=footclient
  '';
}
