{ pkgs, ... }:
{
  home.stateVersion = "24.11";

  imports = [
    ./btop
    ./dunst
    ./foot
    ./hypr
    ./waybar
    ./wofi
    ./xdg
    ./gtk
  ];

  programs = {
    home-manager.enable = true;

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      history.share = false;
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
        theme = "robbyrussell";
      };
    };

    direnv = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    git = {
      enable = true;
      userName = "mkuritsu";
      userEmail = "mkuritsuu@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };
}
