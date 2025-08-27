{...}: {
  home = {
    stateVersion = "24.11";
    username = "kuritsu";
    homeDirectory = "/home/kuritsu";
  };

  imports = [
    ./browser.nix
    ./btop.nix
    ./files.nix
    ./git.nix
    ./kitty.nix
    ./misc.nix
    ./mpd.nix
    ./shell.nix
    ./theming.nix
    ./tmux.nix
  ];
}
