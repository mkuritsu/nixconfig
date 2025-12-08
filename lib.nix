{
  self,
  inputs,
}: let
  inherit (inputs) nixpkgs;

  systems = [
    "x86_64-linux"
    "aarch64-linux"
  ];
in rec {
  eachSystem = fn: nixpkgs.lib.genAttrs systems (system: fn nixpkgs.legacyPackages.${system});

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
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = {inherit inputs self;};
          }
          ./hosts/${hostname}/configuration.nix
        ]
        ++ userModules
        ++ extraModules;
    };

  mkNixOsSystems = hostnames: builtins.mapAttrs (host: attrs: mkNixOs host attrs) hostnames;
}
