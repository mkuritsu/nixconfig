{ inputs, pkgs, ... }:
{
  programs.firefox = {
    enable = true;

    profiles.default = {
      extensions = {
        packages = with inputs.firefox-addons.packages.${pkgs.system}; [
          bitwarden
          ublock-origin
          sponsorblock
          privacy-badger
          return-youtube-dislikes
        ];
      };

      settings = {
        "dom.security.https_only_mode" = true;
        "extensions.autoDisableScopes" = 0;
      };
    };
  };
}
