{pkgs, ...}: {
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
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
      llvm
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
      libGL
      glfw
      boost
      sdl3
      sdl2-compat
    ];
  };
}
