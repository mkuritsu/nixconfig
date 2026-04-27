{pkgs, ...}:
pkgs.buildFHSEnv {
  name = "nvim";
  targetPkgs = pkgs:
    with pkgs; [
      neovim
      tree-sitter
      gcc
      gnumake
      pkg-config
      stdenv.cc.cc.lib
      cargo
      rustc
    ];
  runScript = "nvim";
}
