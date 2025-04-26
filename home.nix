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

        bash = {
            enable = false;
            enableCompletion = false;
        };

        # zsh = {
        #     enable = true;
        #     enableCompletion = true;
        #     autosuggestion.enable = true;
        #     syntaxHighlighting.enable = true;
        # };

        direnv = {
            enable = true;
            enableBashIntegration = true;
            nix-direnv.enable = true;
        };

        vscode = {
            enable = true;
            mutableExtensionsDir = true;
        };
    };
}