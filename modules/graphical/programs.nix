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
      terminal = "kitty";
    };
  };

  environment.systemPackages = with pkgs; [
    mangohud
    vesktop
    discord
    easyeffects
    mpv
    thunderbird
    rnote
    imv
    wiremix
    scrcpy
    wl-clipboard
    nautilus
    file-roller
    papers
    kdePackages.okular
    vscode
    zotero
  ];
}
