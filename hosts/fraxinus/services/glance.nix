{
  services.glance = {
    enable = true;
    settings = {
      pages = [
        {
          name = "Dashboard";
          columns = [
            {
              size = "full";
              widgets = [
                {
                  type = "monitor";
                  cache = "1m";
                  title = "Services";
                  sites = [
                    {
                      title = "Git";
                      url = "http://127.0.0.1:3000";
                    }
                    {
                      title = "Storage";
                      url = "http://127.0.0.1:8081";
                    }
                  ];
                }
              ];
            }
          ];
        }
      ];
    };
  };
}
