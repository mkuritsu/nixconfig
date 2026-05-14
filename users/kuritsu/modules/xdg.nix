{osConfig, pkgs, lib, ...}: let
  is-graphical = osConfig.hardware.graphics.enable;
in {
  xdg.userDirs = {
    enable = true;
    createDirectories = is-graphical;
    setSessionVariables = true;
  };

  home.activation = lib.mkIf is-graphical {
    # Update gtk bookmarks
    gtk-bookmarks = lib.hm.dag.entryAfter ["writeBoundary"] ''
      ${lib.getExe pkgs.xdg-user-dirs-gtk}
    '';
  };
}
