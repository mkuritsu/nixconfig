{ lib, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history.share = false;
    initContent = ''
      alias code='code --ozone-platform-hint=wayland'

      bindkey "^[[1;3C" forward-word
      bindkey "^[[1;3D" backward-word
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word
      bindkey  "^[[H"   beginning-of-line
      bindkey  "^[[F"   end-of-line
      bindkey  "^[[3~"  delete-char
      bindkey "\e\x7f" backward-kill-word

      bindkey -s "^t" "tmux-sessionizer\n"
      bindkey -s "^f" "cd \$(find ~/ ~/Dev . -mindepth 1 -maxdepth 1 -type d | fzf)\n"
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
    enableBashIntegration = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.tmux = {
    enable = true;
    mouse = true;
    newSession = true;
    prefix = "C-Space";
    baseIndex = 1;
    terminal = "screen-256color";
  };

  programs.foot = {
    enable = true;
    server.enable = true;
  };

  xdg.configFile."foot/foot.ini".source = ./foot/foot.ini;
  xdg.configFile."foot/colors.ini".source = ./foot/colors.ini;
}
