{pkgs, ...}: {
  hardware.graphics.extraPackages = with pkgs; [
    libva-vdpau-driver
    libvdpau-va-gl
  ];

  environment.variables = {
    "LIBVA_DRIVER_NAME" = "radeonsi";
  };
}
