{ writeShellScriptBin }:
writeShellScriptBin "tmux-sessionizer" (builtins.readFile ./tmux-sessionizer.sh)
