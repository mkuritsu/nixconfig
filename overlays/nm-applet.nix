_: prev: {
  networkmanagerapplet =
    prev.networkmanagerapplet.overrideAttrs
    (oldAttrs: {
      postPatch =
        oldAttrs.postPatch
        + ''
          rm -rf $out/etc/xdg/autostart
        '';
    });
}
