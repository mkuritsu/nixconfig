{ writeShellScriptBin }:
writeShellScriptBin "reverb-toggle" ''
  value=$(dconf read /com/github/wwmm/easyeffects/streaminputs/reverb/0/bypass)

  if [ "$value" = "true" ]; then
    dconf write /com/github/wwmm/easyeffects/streaminputs/reverb/0/bypass false
  else
    dconf write /com/github/wwmm/easyeffects/streaminputs/reverb/0/bypass true
  fi
''
