{
  inputs,
  pkgs,
  ...
}: let
  inherit (pkgs.stdenv.hostPlatform) system;

  helium-kdewallet = pkgs.symlinkJoin {
    name = "helium";
    buildInputs = [ pkgs.makeWrapper ];
    paths = [inputs.helium-browser.packages.${system}.default];
    postBuild = ''
      wrapProgram $out/bin/helium \
        --add-flags "--password-store=kwallet6"
    '';
  };
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
    helium-kdewallet
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

    nil
    alejandra
    nixd
  ];
}
