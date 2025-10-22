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
    zotero
    libreoffice-fresh
    gimp
    kdePackages.kdenlive
    vscodium-marketplace
  ];
}
