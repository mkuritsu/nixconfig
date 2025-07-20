{
  description = "C/C++ flake template";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default";
  };

  outputs =
    { nixpkgs, systems, ... }:
    let
      eachSystem =
        fn:
        nixpkgs.lib.genAttrs (import systems) (
          system:
          let
            pkgs = import nixpkgs {
              inherit system;
            };
          in
          fn pkgs
        );
    in
    {
      devShells = eachSystem (pkgs: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            cmake
            ninja
            pkg-config
            ccache
            clang-tools
            clang
            gdb
            valgrind
          ];
        };
      });
    };
}
