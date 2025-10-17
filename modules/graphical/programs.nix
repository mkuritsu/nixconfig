{
  pkgs,
  ...
}:
{
  programs = {
    obs-studio = {
      enable = true;
      enableVirtualCamera = true;
    };
    nautilus-open-any-terminal = {
      enable = true;
      terminal = "ghostty";
    };
  };

  environment.systemPackages = with pkgs; [
    mangohud
    discord
    easyeffects
    thunderbird
    rnote
    wiremix
    scrcpy
    wl-clipboard
    vscode
    zotero
    libreoffice-fresh
    gimp
    kdePackages.kdenlive
  ];
}
