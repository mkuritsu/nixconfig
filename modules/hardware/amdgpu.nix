{pkgs, ...}: {
  hardware.graphics.extraPackages = with pkgs; [
    libva-vdpau-driver
    libvdpau-va-gl
  ];

  nixpkgs.overlays = [
    (_: prev: {
      btop = prev.btop.override {rocmSupport = true;};
    })
  ];

  environment.variables = {
    "LIBVA_DRIVER_NAME" = "radeonsi";
  };
}
