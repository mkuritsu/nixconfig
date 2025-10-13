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

  environment.etc."/xdg/menus/applications.menu".text =
    builtins.readFile "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";

  environment.systemPackages = with pkgs; [
    mangohud
    discord
    easyeffects
    mpv
    thunderbird
    rnote
    imv
    wiremix
    scrcpy
    wl-clipboard
    vscode
    zotero
    libreoffice-fresh
    gimp

    nautilus
    file-roller
    papers

    kdePackages.okular
    kdePackages.kdenlive
    kdePackages.dolphin
    kdePackages.ark
  ];
}
