{pkgs, ...}: {
  hardware.graphics.extraPackages = with pkgs; [
    intel-media-driver
    libva-vdpau-driver
    libvdpau-va-gl
  ];

  environment.variables = {
    "LIBVA_DRIVER_NAME" = "iHD";
  };
}