let
  zaphkiel-puk = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILQal/DahsRUK4VYyFDVkgKho7rm5PJSr8msCE5Wp/Y8 kuritsu@zaphkiel";
in
{
  "zaphkiel-tailscale.age".publicKeys = [ zaphkiel-puk ];
}
