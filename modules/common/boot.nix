{ pkgs, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    plymouth = {
      enable = true;
      theme = "rings";
      themePackages = with pkgs; [
        # By default we would install all themes
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "rings" ];
        })
      ];
    };

    consoleLogLevel = 3;
    loader.timeout = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
    ];
  };

  hardware.enableRedistributableFirmware = true;
}
