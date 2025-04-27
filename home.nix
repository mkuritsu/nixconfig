{ config, pkgs, ... }:
{
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

    vscode = {
      enable = true;
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;
      mutableExtensionsDir = false;
      extensions = with pkgs.vscode-marketplace; [
        catppuccin.catppuccin-vsc
        llvm-vs-code-extensions.vscode-clangd
        ms-vscode.cmake-tools
        icrawl.discord-vscode
        ms-azuretools.vscode-docker
        editorconfig.editorconfig
        tamasfe.even-better-toml
        vscjava.vscode-gradle
        redhat.java
        ms-vsliveshare.vsliveshare
        pkief.material-icon-theme
        vscjava.vscode-maven
        mesonbuild.mesonbuild
        jnoortheen.nix-ide
        ms-python.python
        rust-lang.rust-analyzer
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
  };
}
