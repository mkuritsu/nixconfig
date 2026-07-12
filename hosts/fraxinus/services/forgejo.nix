{
  services.forgejo = {
    enable = true;
    database.type = "sqlite3";
    settings = {
      server = {
        DOMAIN = "git.mkuritsu.dev";
        ROOT_URL = "http://git.mkuritsu.dev";
        HTTP_ADDR = "127.0.0.1";
        HTTP_PORT = 3000;
      };
    };
  };
}
