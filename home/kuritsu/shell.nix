{lib, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history.share = false;
    initContent = ''
      alias code='codium --ozone-platform-hint=wayland'
      alias ls='ls --color=auto'
      alias ip='ip --color=auto'
      alias grep='grep --color=auto'

      bindkey "^[[1;3C" forward-word
      bindkey "^[[1;3D" backward-word
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word
      bindkey  "^[[H"   beginning-of-line
      bindkey  "^[[F"   end-of-line
      bindkey  "^[[3~"  delete-char
      bindkey "\e\x7f" backward-kill-word

      bindkey -s "^f" "dir=\$(find ~/ ~/Dev . -mindepth 1 -maxdepth 1 -type d | fzf) && [ -n \$dir ] && cd \$dir\n"
    '';
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      format = lib.concatStrings [
        "$username"
        "$directory"
        "$git_branch"
        "$character"
      ];
      line_break = false;
      username = {
        show_always = true;
        format = "[$user]($style) ";
      };
      git_branch = {
        symbol = " ";
        format = "[$symbol$branch(:$remote_branch)]($style) ";
      };
      character = {
        success_symbol = "[λ](bold green)";
        error_symbol = "[λ](bold red)";
      };
    };
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}
