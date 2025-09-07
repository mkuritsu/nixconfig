{ sources, ... }:
let
  nixosSystem = import (sources.nixpkgs + "/nixos/lib/eval-config.nix");

  mkNixOs =
    hostname:
    {
      users ? [ ],
      modules ? [ ],
    }:
    let
      extraModules = map (module: ../modules/${module}) modules;
      userModules = map (user: ../users/${user}.nix) users;
      overlays = [ (import ../packages/overlay.nix) ];
    in
    nixosSystem {
      specialArgs = { inherit sources; };
      modules = [
        { nixpkgs.overlays = overlays; }
        { networking.hostName = hostname; }
        ./${hostname}/configuration.nix
      ]
      ++ userModules
      ++ extraModules;
    };

  mkNixOsSystems = hostnames: builtins.mapAttrs (host: attrs: mkNixOs host attrs) hostnames;
in
mkNixOsSystems {
  zaphkiel = {
    modules = [
      "common"
      "graphical"
      "gaming"
    ];
    users = [ "kuritsu" ];
  };

  camael = {
    modules = [
      "common"
      "graphical"
    ];
    users = [ "kuritsu" ];
  };

  fraxinus = {
    modules = [
      "common"
    ];
  };
}
