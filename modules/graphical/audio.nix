{
  services.pulseaudio.enable = false;

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;

    wireplumber = {
      enable = true;
      extraConfig = {
        "10-alsa-rules" = {
          "monitor.alsa.rules" = [
            {
              matches = [
                {
                  "device.name" = "~alsa_card.*";
                }
                {
                  "node.name" = "~alsa_output.*";
                }
              ];

              actions.update-props = {
                "session.suspend-timeout-seconds" = 0;
                "api.alsa.period-size" = 1024;
                "api.alsa.headroom" = 2048;
              };
            }
          ];
        };
      };
    };
  };
}
