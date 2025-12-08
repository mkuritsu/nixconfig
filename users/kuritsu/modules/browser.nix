{inputs, ...}: let
  mkFirefoxExtensions = extensions:
    builtins.listToAttrs (
      map (extensionId: {
        name = extensionId;
        value = {
          "installation_mode" = "force_installed";
          "install_url" = "https://addons.mozilla.org/firefox/downloads/latest/${extensionId}/latest.xpi";
        };
      })
      extensions
    );

  firefoxPolicies = {
    ExtensionSettings = mkFirefoxExtensions [
      "{446900e4-71c2-419f-a6a7-df9c091e268b}" # bitwarden
      "sponsorBlocker@ajay.app"
      "uBlock0@raymondhill.net"
      "{d7742d87-e61d-4b78-b8a1-b469842139fa}" # vimium
      "addon@darkreader.org"
    ];
  };
in {
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;
    policies = firefoxPolicies;
  };

  programs.chromium = {
    enable = true;
    extensions = [
      "nngceckbapebfimnlniiiahkandclblb" # bitwarden
      "mnjggcdmjocbbbhaepdhchncahnbgone" # sponsor block
      "ddkjiahejlhfcafbddmgiahcphecmpfh" # ublock origin lite
      "dbepggeogbaibhgnhhndojpepiihcmeb" # vimium
      "eimadpbcbfnmbkopoojfekhnkhdbieeh" # dark reader
    ];
  };
}
