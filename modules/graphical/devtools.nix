{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    cargo
    rustc
    clang
    gcc
    cmake
    ninja
    meson
    jdk21
    maven
    python3
    nodejs
    pnpm
    dotnet-sdk
    pkg-config
    uv
    wayland
    openssl
  ];
}
