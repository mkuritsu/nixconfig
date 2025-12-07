{
  services.pulseaudio.enable = false;

  security.rtkit.enable = true;

  services.pipewire =
    let
      quantum = 1024;
      rate = 48000;
    in
    {
      enable = true;
      audio.enable = true;
      alsa.enable = true;
      pulse.enable = true;
      jack.enable = true;
      # extraConfig.pipewire = {
      #   "10-clock-quantum" = {
      #     "context.properties" = {
      #       "default.clock.rate" = rate;
      #       "default.clock.quantum" = quantum;
      #       "default.clock.min-quantum" = quantum;
      #       "default.clock.max-quantum" = quantum;
      #       "default.clock.allowed-rates" = [ rate ];
      #     };
      #   };
      # };

      wireplumber = {
        enable = true;
        extraConfig = {
          "10-clock-quantum" = {
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
