{
  self,
  osConfig,
  pkgs,
  ...
}: let
  inherit (pkgs.stdenv.hostPlatform) system;

  dev-fhs-env = pkgs.buildFHSEnv {
    name = "dev-fhs-env";
    targetPkgs = pkgs: (osConfig.environment.systemPackages ++ (with pkgs; [bash rustup gcc pkg-config wayland libxkbcommon udev udev.dev libinput libgbm seatd seatd.dev libGL libGL.dev neovim tree-sitter nodejs python3 vscode zed-editor]));
    runScript = ''
      bash -c 'export IN_NIX_SHELL=impure name=dev-fhs-env; $SHELL'
    '';
  };
in {
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    setSessionVariables = true;
  };

  programs.distrobox = {
    enable = true;
    enableSystemdUnit = true;
    containers = {
      arch-dev = {
        image = "quay.io/toolbx/arch-toolbox:latest";
        entry = true;
        additional_packages = "git python ripgrep fzf fd fish starship gcc make clang rustup";
      };
    };
  };

  home.packages = [
    dev-fhs-env
    self.packages.${system}.neovim-fhs
    self.packages.${system}.my-vscode-fhs
    pkgs.zed-editor-fhs
  ];
}
