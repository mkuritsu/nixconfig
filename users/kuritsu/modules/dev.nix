{
  self,
  osConfig,
  pkgs,
  lib,
  ...
}: let
  inherit (pkgs.stdenv.hostPlatform) system;

  fhs-packages = pkgs: with pkgs; [bash rustup gcc pkg-config wayland libxkbcommon udev udev.dev libinput libgbm seatd seatd.dev libGL libGL.dev tree-sitter nodejs python3];

  dev-fhs-env = pkgs.buildFHSEnv {
    name = "dev-fhs-env";
    targetPkgs = pkgs: [pkgs.vscode pkgs.zed-editor pkgs.neovim] ++ (fhs-packages pkgs);
    runScript = "fish";
    profile = ''
      export IN_NIX_SHELL=impure
      export name=dev-fhs-env
    '';
  };

  neovim-fhs = pkgs.buildFHSEnv {
    name = "nvim";
    targetPkgs = pkgs: [pkgs.neovim] ++ (fhs-packages pkgs);
    runScript = "nvim";
    profile = ''
      export IN_NIX_SHELL=impure
      export name=neovim-fhs
    '';
  };

  # HACK: probably find later a better way to check for graphical environment?
  is-graphical = osConfig.hardware.graphics.enable;
in {
  home.packages =
    if is-graphical
    then [
      dev-fhs-env
      neovim-fhs
      (pkgs.vscode.fhsWithPackages fhs-packages)
      (pkgs.zed-editor.fhsWithPackages fhs-packages)
      pkgs.distrobox
    ]
    else [pkgs.neovim];
}
