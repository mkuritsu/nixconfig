let
  zaphkiel = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIjh3oOXmEAySNLFhEUthT2r9b2kDL93D33ngfyrOJQm root@zaphkiel";
  fraxinus = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFhnSvhafaGitgU0V7r2k/USCDQ196CuuxoCKzu99Bjg root@nixos";
in {
  "zaphkiel-tailscale.age".publicKeys = [zaphkiel];
  "fraxinus-tailscale.age".publicKeys = [fraxinus];
  "istannouncements-webhook.age".publicKeys = [
    zaphkiel
    fraxinus
  ];
}
