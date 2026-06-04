{
  inputs,
  pkgs,
  ...
}: let
  inherit (pkgs.stdenv.hostPlatform) system;
in {
  programs = {
    obs-studio = {
      enable = true;
      enableVirtualCamera = true;
    };
    appimage = {
      enable = true;
      binfmt = true;
    };
  };

  environment.systemPackages = with pkgs; [
    wiremix
    scrcpy
    wl-clipboard
    mangohud
    inputs.helium-browser.packages.${system}.default
    firefox
    vscode
    zed-editor

    gcc
    gnumake
    meson
    cmake
    ccache
    ninja

    nodejs
    pnpm

    python314
    python314Packages.pip
    uv

    jdk21
    maven
    gradle

    rustup
    lua
    dotnet-sdk
  ];
}
