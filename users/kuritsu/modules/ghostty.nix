{pkgs, ...}: let
  custom-css = pkgs.writeText "ghostty-custom-css" ''
    headerbar {
      margin: 0;
      padding: 0;
    }

    tabbar tabbox {
      margin: 0;
      padding: 0;
      min-height: 10px;
    }

    tabbar tabbox tab {
      margin: 0;
      padding: 0;
    }

    tabbar tabbox tab label {
      font-size: 12px;
      font-family: CaskaydiaMono Nerd Font;
    }
  '';
in {
  programs.ghostty = {
    enable = true;
    systemd.enable = true;
    settings = {
      command = "fish";
      theme = "Everforest Dark Hard";
      font-family = "CaskaydiaMono Nerd Font";
      font-size = 12;
      gtk-wide-tabs = false;
      gtk-custom-css = "${custom-css}";
      quit-after-last-window-closed = false;
      background-opacity = 0.9;
      window-padding-color = "extend";
      window-padding-balance = true;
      shell-integration-features = "ssh-terminfo,ssh-env";
    };
  };
}
