{ ... }:
{
  programs.tmux = {
    enable = true;
    mouse = true;
    newSession = true;
    prefix = "C-Space";
    baseIndex = 1;
    terminal = "screen-256color";
  };
}
