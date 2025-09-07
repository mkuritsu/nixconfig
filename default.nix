let
  sources = import ./npins;
in
{
  nixosConfigurations = import ./hosts { inherit sources; };
}
