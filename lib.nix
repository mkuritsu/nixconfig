{
  self,
  inputs,
}: let
  inherit (inputs) nixpkgs systems home-manager;
in rec {
  eachSystem = fn: nixpkgs.lib.genAttrs (import systems) (system: fn nixpkgs.legacyPackages.${system});

  mkNixOs = hostname: {
    users ? [],
    modules ? [],
  }: let
    extraModules = map (module: ./modules/${module}) modules;
    userModules = map (user: ./users/${user}/user.nix) users;
  in
    nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs self;};
      modules =
        [
          {networking.hostName = hostname;}
          ./hosts/${hostname}/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = {inherit inputs self;};
          }
        ]
        ++ userModules
        ++ extraModules;
    };

  mkNixOsSystems = hostnames: builtins.mapAttrs (host: attrs: mkNixOs host attrs) hostnames;
}
