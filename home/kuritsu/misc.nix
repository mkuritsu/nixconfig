{ ... }:
let
  terminalApp = "kitty";
in
{
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };

  home.sessionVariables = {
    BROWSER = "chromium";
    TERMINAL = "${terminalApp}";
  };

  # changes the terminal that dolphin uses
  home.file.".config/kdeglobals".text = ''
    [General]
    TerminalApplication=${terminalApp}
  '';
}
