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
        "extensions.autoDisableScopes" = 0; # needed this so extensions actually get installed
      };
    };
  };

  programs.chromium = {
    enable = true;

    extensions = [
      "nngceckbapebfimnlniiiahkandclblb" # bitwarden
      "pkehgijcmpdhfbdbbnkijodmdjhbjlgp" # privacy badger
      "gebbhagfogifgggkldgodflihgfeippi" # return youtube dislike
      "mnjggcdmjocbbbhaepdhchncahnbgone" # sponsor block
      "ddkjiahejlhfcafbddmgiahcphecmpfh" # ublock origin lite
    ];
  };
}
