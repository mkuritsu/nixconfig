{
  pkgs,
  ...
}:
let
  vscode-product-json = "${pkgs.vscode}/lib/vscode/resources/app/product.json";

  vscodium-marketplace = pkgs.vscodium.overrideAttrs (oldAttrs: {
    postInstall = (oldAttrs.postInstall or "") + ''
      cp "${vscode-product-json}" $out/lib/vscode/resources/app/product.json
    '';
  });
in
{
  programs = {
    virt-manager.enable = true;
    obs-studio = {
      enable = true;
      enableVirtualCamera = true;
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
    zotero
    libreoffice-fresh
    gimp
    imv
    kdePackages.kdenlive
    kdePackages.ffmpegthumbs
    kdePackages.kdegraphics-thumbnailers
    kdePackages.gwenview
    vscodium-marketplace
    obsidian
    vagrant
  ];
}
