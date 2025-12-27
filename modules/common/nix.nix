{
  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--no-gcroots --optimise --keep-since 7d";
    };
  };
}
