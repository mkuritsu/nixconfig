{
  services.forgejo = {
    enable = true;
    database.type = "sqlite3";
    settings = {
      server = {
        DOMAIN = "git.fraxinus.local";
        ROOT_URL = "http://git.fraxinus.local";
        HTTP_ADDR = "127.0.0.1";
        HTTP_PORT = 3000;
      };
    };
  };
}
