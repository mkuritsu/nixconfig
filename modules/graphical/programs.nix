{
  inputs,
  pkgs,
  ...
}: let
  inherit (pkgs.stdenv.hostPlatform) system;

  # ensure gnome-keyring is used, this preserves browser logins across desktops (plasma, hypr, niri and gnome)
  helium-keyring = pkgs.symlinkJoin {
    name = "helium";
    buildInputs = [ pkgs.makeWrapper ];
    paths = [inputs.helium-browser.packages.${system}.default];
    postBuild = ''
      wrapProgram $out/bin/helium \
        --add-flags "--password-store=gnome-libsecret"
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

  services.flatpak.packages = [
    "com.discordapp.Discord"
    "com.spotify.Client"
  ];

  environment.systemPackages = with pkgs; [
    wiremix
    scrcpy
    wl-clipboard
    mangohud
    helium-keyring
    firefox
    vscode
    zed-editor
    adwaita-icon-theme
    yt-dlp
    mpv
    ghostty
    foot

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
