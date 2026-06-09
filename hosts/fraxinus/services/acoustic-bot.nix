{
  inputs,
  config,
  ...
}: {
  imports = [
    inputs.acoustic-bot.nixosModules.default
  ];

  services.acoustic-bot = {
    enable = true;
    envFile = config.age.secrets.acoustic-bot-env.path;
  };
}
