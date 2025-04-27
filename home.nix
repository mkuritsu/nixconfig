{ config, pkgs, ... }: {
  home.stateVersion = "24.11";
  home.username = "kuritsu";
  home.homeDirectory = "/home/kuritsu";
  programs.home-manager.enable = true;

  programs = {
    starship = {
      enable = true;
      settings = {
        add_newline = false;
        aws.disabled = true;
        gcloud.disabled = true;
      };
    };
    chromium = {
      enable = true;
      extensions = [
        { id = "nngceckbapebfimnlniiiahkandclblb"; } # bitwarden
        { id = "pkehgijcmpdhfbdbbnkijodmdjhbjlgp"; } # privact badger
        { id = "gebbhagfogifgggkldgodflihgfeippi"; } # return youtube dislike
        { id = "mnjggcdmjocbbbhaepdhchncahnbgone"; } # sponsor block
        { id = "ddkjiahejlhfcafbddmgiahcphecmpfh"; } # ublock origin lite
        { id = "kehjfphhkfppnnjhdfhanmehkegdppho"; } # youtube row fixer
      ];
    };

    bash = {
      enable = false;
      enableCompletion = true;
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
    };

    direnv = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    vscode = {
      enable = true;
      mutableExtensionsDir = true;
    };
  };
}
