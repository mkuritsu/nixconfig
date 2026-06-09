{pkgs, ...}: {
  services.desktopManager.plasma6.enable = true;

  environment.systemPackages = with pkgs; [
    kdePackages.okular
    kdePackages.dolphin
    kdePackages.ark
    kdePackages.gwenview
    haruna
  ];
}