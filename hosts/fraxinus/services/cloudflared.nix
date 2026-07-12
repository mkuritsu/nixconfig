{
  services.cloudflared = {
    enable = true;
    tunnels = {
      "89b500be-cf14-4036-bda5-e9700c22252a" = {
        credentialsFile = "/home/kuritsu/.cloudflared/89b500be-cf14-4036-bda5-e9700c22252a.json";
        default = "http_status:404";
        ingress = {
          "git.mkuritsu.dev" = "http://localhost:3000";
          "files.mkuritsu.dev" = "http://localhost:8081";
        };
      };
    };
  };
}
