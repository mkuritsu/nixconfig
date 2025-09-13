{ ... }:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
