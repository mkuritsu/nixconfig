{
  self,
  pkgs,
  ...
}: let
  inherit (pkgs.stdenv.hostPlatform) system;
in {
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
    self.packages.${system}.helium-browser
    gnome-software
  ];
}
