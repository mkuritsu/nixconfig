{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    jdk
    python3
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
}
