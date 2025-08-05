{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    mouse = true;
    prefix = "C-a";
    baseIndex = 1;
    secureSocket = true;
    plugins = [
      {
        plugin = pkgs.tmuxPlugins.tokyo-night-tmux;
        extraConfig = "set -g @tokyo-night-tmux_transparent 1";
      }
    ];
    extraConfig = ''
      bind-key & kill-window
      bind-key x kill-pane
    '';
  };
}
