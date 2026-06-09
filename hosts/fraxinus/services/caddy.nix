{
  services.caddy = {
    enable = true;
    openFirewall = true;
    virtualHosts = {
      "fraxinus.local".extraConfig = ''reverse_proxy 127.0.0.1:8080'';
      "git.fraxinus.local".extraConfig = ''reverse_proxy 127.0.0.1:3000'';
      "files.fraxinus.local".extraConfig = ''reverse_proxy 127.0.0.1:8081'';
    };
  };
}
