{ writeShellScriptBin }:
writeShellScriptBin "hyprpaper-switcher" (builtins.readFile ./hyprpaper-switcher.sh)
