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

  environment.systemPackages = with pkgs; [
    wiremix
    scrcpy
    wl-clipboard
    mangohud
    zotero
    zed-editor-fhs
    vscode-fhs
    chromium
    gnome-software
  ];
}
