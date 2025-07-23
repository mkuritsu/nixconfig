{ self, inputs }:
let
  inherit (inputs) nixpkgs systems home-manager;
in
{
  eachSystem =
    fn: nixpkgs.lib.genAttrs (import systems) (system: fn nixpkgs.legacyPackages.${system});

  mkNixOs =
    hostname:
    {
      users ? [ ],
      modules ? [ ],
    }:
    let
      extraModules = map (module: ./modules/${module}) modules;
      userModules = map (user: ./users/${user}.nix) users;
      mkUserAttrSet = username: {
        name = "${username}";
        value = ./home/${username};
      };
      userHomes = builtins.listToAttrs (map mkUserAttrSet users);
    in
    nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs self; };
      modules = [
        ./hosts/${hostname}/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.extraSpecialArgs = { inherit inputs self; };
          home-manager.users = userHomes;
        }
      ]
      ++ userModules
      ++ extraModules;
    };
}
