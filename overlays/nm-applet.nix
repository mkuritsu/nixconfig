_: prev: {
  nm-connection-editor-only =
    prev.networkmanagerapplet.overrideAttrs
    (_: {
      postInstall = ''
        rm -rf $out/etc/xdg/autostart
      '';
    });
}
