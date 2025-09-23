{
  self,
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
    discord
    vesktop
    mpv
    thunderbird
    rnote
    imv
    wiremix
    easyeffects
    scrcpy
    wl-clipboard
    nautilus
    file-roller
    papers
    kdePackages.okular
    vscode
    self.packages.${pkgs.system}.reverb-toggle
  ];
}
