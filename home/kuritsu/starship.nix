{ lib, ... }:
{
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
}
