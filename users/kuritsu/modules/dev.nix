{
  osConfig,
  pkgs,
  ...
}: let
  fhs-packages = pkgs:
    with pkgs;
      [
        # Shells
        bash
        fish

        # Languages
        rustup
        nodejs
        pnpm
        bun
        python3
        uv
        jdk21
        jdk25
        maven
        go
        gcc
        clang
        gnumake
        ninja
        cmake
        meson
        ccache
        valgrind
        pkg-config

        # System dependencies
        glibc
        libclang
        sqlite
        sqlcipher
        wayland
        libxkbcommon
        udev
        libinput
        libgbm
        seatd
        tree-sitter
        alsa-lib
        pipewire
        xwayland
        libGL
        vulkan-loader
        vulkan-tools
        vulkan-headers
        vulkan-validation-layers
        glslang
        spirv-tools
        mesa
        libGLU
        libglvnd
        egl-wayland
        libdrm
        freetype
        fontconfig
        mesa-demos
        libxkbcommon
        libX11
        libXext
        libXrender
        libXrandr
        libXi
        libXcursor
        libXfixes
        libXScrnSaver
        libXcomposite
        libXdamage
        libXtst
        libXinerama
        libxcb
        xcbutil
        xcbutilimage
        xcbutilkeysyms
        xcbutilrenderutil
        xcbutilwm
        xorgproto
        xorg-server
        zlib
        glib
        libdisplay-info
        gobject-introspection
        gtk3
        cairo
        pango
        harfbuzz
        pixman
        dbus
      ]
      ++ osConfig.environment.systemPackages;

  dev-env = pkgs.buildFHSEnv {
    name = "dev-env";
    extraOutputsToInstall = ["out" "dev" "bin" "lib" "share"];
    targetPkgs = pkgs: fhs-packages pkgs;
    runScript = "fish";
    profile = ''
      export IN_NIX_SHELL=impure
      export name=dev-env
    '';
  };

  # HACK: probably find later a better way to check for graphical environment?
  is-graphical = osConfig.hardware.graphics.enable;
in {
  # programs.distrobox.enable = is-graphical;

  home.packages =
    if is-graphical
    then [
      pkgs.neovim
      pkgs.tree-sitter
      pkgs.neovide
      dev-env
    ]
    else [pkgs.neovim];
}
