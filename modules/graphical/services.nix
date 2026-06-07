{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nix-flatpak.nixosModules.nix-flatpak
  ];

  hardware = {
    bluetooth.enable = true;
    opentabletdriver = {
      enable = true;
      daemon.enable = true;
    };
  };

  services = {
    upower.enable = true;
    udisks2.enable = true;
    gvfs.enable = true;
    printing.enable = true;
    playerctld.enable = true;

    displayManager.plasma-login-manager.enable = true;

    # displayManager.ly = {
    #   enable = true;
    #   settings = {
    #     session_log = ".local/state/ly-session.log";
    #   };
    # };

    flatpak = {
      enable = true;
      packages = [
        "com.discordapp.Discord"
        "com.spotify.Client"
      ];
      update.auto = {
        enable = true;
        onCalendar = "daily";
      };
    };
  };

  xdg = {
    mime.enable = true;
    menus.enable = true;
    portal = {
      enable = true;
      extraPortals = with pkgs; [xdg-desktop-portal-gnome xdg-desktop-portal-gtk];
    };
  };
}
