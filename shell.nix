{pkgs ? import <nixpkgs> {}}:
pkgs.mkShellNoCC {
  env.FLAKE_ROOT = "${builtins.toString ./.}";
}
