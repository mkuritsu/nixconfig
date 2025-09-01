_: {
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  services = {
    mpd = {
      enable = true;
      extraConfig = ''
        audio_output {
          type "pulse"
          name "Pulse MPD"
        }
      '';
    };

    mpd-discord-rpc.enable = true;
  };
}
