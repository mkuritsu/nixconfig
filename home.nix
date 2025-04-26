{ config, pkgs, ... }:
{
    home.stateVersion = "24.11";
    home.username = "kuritsu";
    home.homeDirectory = "/home/kuritsu";

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
            enable = true;
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
            nix-direnv.enable = true;
        };

        home-manager.enable = true;
    };
}