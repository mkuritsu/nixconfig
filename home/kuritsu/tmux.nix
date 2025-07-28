{ ... }:
{
  programs.tmux = {
    enable = true;
    mouse = true;
    newSession = true;
    prefix = "C-Space";
    baseIndex = 1;
    secureSocket = true;
    extraConfig = ''
      bind-key & kill-window
      bind-key x kill-pane
    '';
  };
}
