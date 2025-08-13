{...}: {
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  # changes the terminal that dolphin uses
  home.file.".config/kdeglobals".text = ''
    [General]
    TerminalApplication=kitty
  '';
}
