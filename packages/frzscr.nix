inputs:
{
  stdenv,
  meson,
  wayland-scanner,
  pkg-config,
  ninja,
  wayland,
}:
stdenv.mkDerivation rec {
  pname = "frzscr";
  version = "9ae7e9fb3e3085db3a48becf03f935c1182df5f7";

  src = inputs.frzscr;

  nativeBuildInputs = [
    meson
    ninja
    wayland-scanner
    pkg-config
  ];

  buildInputs = [
    wayland
  ];

  installPhase = ''
    mkdir -p $out/bin
    install -Dm755 ${pname} $out/bin
    install -Dm644 $src/LICENSE $out/share/licenses/${pname}
    install -Dm644 $src/${pname}.1 $out/share/man/man1/${pname}.1
  '';
}
