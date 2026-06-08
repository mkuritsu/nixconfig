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

  virtualisation.libvirtd = {
    enable = true;
    qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
  };
  programs.virt-manager.enable = true;

  environment.systemPackages = [ pkgs.dnsmasq];

  services = {
    upower.enable = true;
    udisks2.enable = true;
    gvfs.enable = true;
    printing.enable = true;
    playerctld.enable = true;
    displayManager.cosmic-greeter.enable = true;

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
