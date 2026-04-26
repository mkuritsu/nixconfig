{pkgs, ...}: {
  programs = {
    obs-studio = {
      enable = true;
      enableVirtualCamera = true;
    };
    appimage = {
      enable = true;
      binfmt = true;
    };
  };

  # virtualisation.virtualbox.host.enable = true;

  environment.systemPackages = with pkgs; [
    wiremix
    scrcpy
    wl-clipboard
    mangohud
    zotero
    zed-editor
    vscode
    chromium
    gnome-software
  ];
}
