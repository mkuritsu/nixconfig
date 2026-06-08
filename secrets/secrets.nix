let
  fraxinus = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFhnSvhafaGitgU0V7r2k/USCDQ196CuuxoCKzu99Bjg root@nixos";
in {
  "fraxinus-tailscale.age".publicKeys = [fraxinus];
  "acoustic-bot-env.age".publicKeys = [fraxinus];
}
