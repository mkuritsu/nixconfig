{ pkgs, ... }:
let
  packages = with pkgs; [
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
  ];
in
{
  programs.nix-ld = {
    enable = true;
    libraries = packages;
  };

  environment.systemPackages = packages;
}
