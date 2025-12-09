{
  inputs,
  pkgs,
  ...
}: let
  vscode-product-json = "${pkgs.vscode}/lib/vscode/resources/app/product.json";

  vscodium-marketplace = pkgs.vscodium.overrideAttrs (oldAttrs: {
    postInstall =
      (oldAttrs.postInstall or "")
      + ''
        cp "${vscode-product-json}" $out/lib/vscode/resources/app/product.json
      '';
  });
in {
  programs = {
    virt-manager.enable = true;
    obs-studio = {
      enable = true;
      enableVirtualCamera = true;
    };
  };

  virtualisation.virtualbox.host.enable = true;

  environment.systemPackages = with pkgs; [
    wiremix
    scrcpy
    wl-clipboard

    mangohud
    obsidian
    discord
    easyeffects
    thunderbird
    rnote
    zotero
    libreoffice-fresh
    gimp
    kdePackages.kdenlive
    vscodium-marketplace
    vagrant
  ];
}
