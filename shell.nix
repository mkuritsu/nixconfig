{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  env.FLAKE_ROOT = "${builtins.toString ./.}";
}
