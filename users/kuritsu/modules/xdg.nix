{pkgs, lib, ...}: {
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    setSessionVariables = true;
  };

  home.activation = {
    # Update gtk bookmarks
    gtk-bookmarks = lib.hm.dag.entryAfter ["writeBoundary"] ''
      ${lib.getExe pkgs.xdg-user-dirs-gtk}
    '';
  };
}
