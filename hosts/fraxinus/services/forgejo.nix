{
  services.forgejo = {
    enable = true;
    database.type = "sqlite3";
    settings = {
      server = {
        DOMAIN = "git.mkuritsu.dev";
        ROOT_URL = "https://git.mkuritsu.dev";
        HTTP_ADDR = "127.0.0.1";
        HTTP_PORT = 3000;
        DISABLE_REGISTRATION = false;
        REGISTER_MANUAL_CONFIRM = true;
      };
    };
  };
}
