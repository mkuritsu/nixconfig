# Current non ideal way to have this to run on my PC with minimal effort
# I want to try to package this later to also have a desktop file, build from source,
# dont use appimage (if possible), and be a flake input for auto updates with 'nix flake update'
{ appimageTools, fetchurl }:
let
  pname = "youtube-music";
  version = "3.9.0";

  src = fetchurl {
    url = "https://github.com/th-ch/youtube-music/releases/download/v${version}/YouTube-Music-${version}.AppImage";
    hash = "sha256-J9etzchwcPjieK1k4kpsg0VGzwVctg9888xj0ExtLFY";
  };
in
appimageTools.wrapType2 {
  inherit pname version src;
}
