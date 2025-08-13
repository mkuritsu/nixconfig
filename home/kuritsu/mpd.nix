{...}: {
  services.mpd = {
    enable = true;
    extraConfig = ''
      audio_output {
        type "pulse"
        name "Pulse MPD"
      }
    '';
  };

  services.mpd-discord-rpc.enable = true;
}
