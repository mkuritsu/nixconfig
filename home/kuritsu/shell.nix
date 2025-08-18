{lib, ...}: {
  programs.fish = {
    enable = true;
    functions = {
      cd_fzf = ''
        set dir $(find ~/ ~/Dev . -mindepth 1 -maxdepth 1 -type d | fzf)
        if test -n "$dir"
          cd $dir
          commandline -f repaint
        end
      '';
      fish_greeting = "";
    };
    binds = {
      "ctrl-f".command = "cd_fzf";
    };
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
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
        success_symbol = "[~>](bold green)";
        error_symbol = "[~>](bold red)";
      };
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
