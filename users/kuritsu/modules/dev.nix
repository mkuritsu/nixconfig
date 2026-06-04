{
  osConfig,
  pkgs,
  ...
}: let
  withDev = pkgList: let
    addDev = pkg:
      if pkg ? dev
      then [pkg pkg.dev]
      else [pkg];
  in
    builtins.concatLists (map addDev pkgList);

  fhs-packages = pkgs:
    withDev
    (with pkgs; [
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
    ]);

  dev-fhs-env = pkgs.buildFHSEnv {
    name = "dev-fhs-env";
    targetPkgs = pkgs: [pkgs.vscode pkgs.zed-editor pkgs.neovim] ++ (fhs-packages pkgs);
    runScript = "fish";
    profile = ''
      export IN_NIX_SHELL=impure
      export name=dev-fhs-env
    '';
  };

  neovim-fhs = pkgs.buildFHSEnv {
    name = "nvim";
    targetPkgs = pkgs: [pkgs.neovim] ++ (fhs-packages pkgs);
    runScript = "nvim";
    profile = ''
      export IN_NIX_SHELL=impure
      export name=neovim-fhs
    '';
  };

  # HACK: probably find later a better way to check for graphical environment?
  is-graphical = osConfig.hardware.graphics.enable;
in {
  programs.distrobox.enable = true;

  home.packages =
    if is-graphical
    then [
      pkgs.neovim
      pkgs.tree-sitter
      pkgs.neovide
    ]
    else [pkgs.neovim];
}
