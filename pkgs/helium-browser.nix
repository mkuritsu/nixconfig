{
  appimageTools,
  fetchurl,
  stdenv,
}: let
  inherit (stdenv.hostPlatform) system;

  sourcesMap = version: {
    "x86_64-linux" = {
      url = "https://github.com/imputnet/helium-linux/releases/download/${version}/helium-${version}-x86_64.AppImage";
      hash = "sha256-Ni7IZ9UBafr+ss0BcQaRKqmlmJI4IV1jRAJ8jhcodlg=";
    };
  };
in
  appimageTools.wrapType2 rec {
    pname = "helium";
    version = "0.11.5.1";
    src = fetchurl (sourcesMap version).${system};

    extraInstallCommands = let
      contents = appimageTools.extract {inherit pname version src;};
    in ''
      mkdir -p "$out/share/applications"
      cp "${contents}/helium.desktop" "$out/share/applications/"
      cp -r ${contents}/usr/share/* "$out/share"
    '';
  }
