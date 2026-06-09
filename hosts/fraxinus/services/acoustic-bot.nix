{config, ...}: {
  virtualisation.oci-containers.containers.acoustic-bot = {
    image = "ghcr.io/mkuritsu/acoustic-bot:latest";
    autoStart = true;
    extraOptions = ["--label=io.containers.autoupdate=registry"];
    environmentFiles = [config.age.secrets.acoustic-bot-env.path];
  };
}
