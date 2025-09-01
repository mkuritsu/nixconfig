{...}: {
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
