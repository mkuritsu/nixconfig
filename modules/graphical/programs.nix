{pkgs, ...}: {
  programs = {
    virt-manager.enable = true;
    obs-studio = {
      enable = true;
      enableVirtualCamera = true;
    };
  };

  virtualisation.virtualbox.host.enable = true;

  environment.systemPackages = with pkgs; [
    wiremix
    scrcpy
    wl-clipboard

    mangohud
    obsidian
    discord
    rnote
    zotero
    zed-editor
  ];
}
