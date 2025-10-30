{
  description = "flake maximal template";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default";
  };

  outputs =
    {
      nixpkgs,
      systems,
      ...
    }:
    let
      eachSystem =
        fn: nixpkgs.lib.genAttrs (import systems) (system: fn nixpkgs.legacyPackages.${system});
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
            jdk21
            maven
            (python3.withPackages (pypkgs: [
            ]))
            cargo
            clippy
            rustc
            rustfmt

            zlib
            zstd
            stdenv.cc.cc
            curl
            openssl
            attr
            libssh
            bzip2
            libxml2
            acl
            libsodium
            util-linux
            xz
            systemd
            wayland
            sqlite
            gcc
            clang
            cmake
            llvm
            openmpi
            pkg-config
            alsa-lib
            vulkan-tools
            vulkan-headers
            vulkan-loader
            vulkan-validation-layers
            lld
            xorg.libX11
            xorg.libXcursor
            xorg.libXi
            xorg.libXrandr
            libxkbcommon
            xorg.libxkbfile
            udev
            python3
            jdk21
            protobuf
            maven
            cargo
            rustc
            boost
            libGL
            glfw
            sdl3
            sdl2-compat

            jdk
            uv
            rustc
            cargo
            clang
            gcc
            gdb
            valgrind
            cmake
            meson
            ninja
            pkg-config
            clang-tools
            nodejs
            pnpm
          ];

          env.RUST_SRC_PATH = "${pkgs.rustPlatform.rustLibSrc}";
        };
      });
    };
}
