let
  zaphkiel = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIjh3oOXmEAySNLFhEUthT2r9b2kDL93D33ngfyrOJQm root@zaphkiel";
in
{
  "zaphkiel-tailscale.age".publicKeys = [ zaphkiel ];
}
