{pkgs, ...}: {
  services.desktopManager.plasma6.enable = true;

  environment.etc."/xdg/menus/applications.menu".text =
    builtins.readFile "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";

  environment.systemPackages = with pkgs; [
    kdePackages.okular
    kdePackages.dolphin
    kdePackages.ark
    kdePackages.gwenview
    haruna
  ];
}
