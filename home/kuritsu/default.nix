{ ... }:
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
    ./tmux
    ./scripts
    ./starship
    ./firefox
    ./ags.nix
  ];

  programs = {
    home-manager.enable = true;

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      history.share = false;
      initContent = ''
        bindkey "^[[1;3C" forward-word
        bindkey "^[[1;3D" backward-word
        bindkey "^[[1;5C" forward-word
        bindkey "^[[1;5D" backward-word
        bindkey  "^[[H"   beginning-of-line
        bindkey  "^[[F"   end-of-line
        bindkey  "^[[3~"  delete-char
        bindkey "\e\x7f" backward-kill-word

        bindkey -s "^f" "~/.local/bin/tmux-sessionizer\n"
        bindkey -s "^t" "tmux a || tmux\n"
      '';
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
      userEmail = "rodrigoalexccorreia@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
        pull.rebase = true;
      };
    };
  };
}
