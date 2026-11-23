{lib, ...}: {
  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "vscode"
      "osu-lazer-bin"
      "vagrant"
      "steam"
      "steam-unwrapped"
    ];

  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--no-gcroots --optimise --keep-since 7d";
    };
  };
}
