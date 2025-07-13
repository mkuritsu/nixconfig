{
  description = "mkuritsu's nixconfig";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    wiremix = {
      url = "github:tsowell/wiremix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-gaming = {
      url = "github:fufexan/nix-gaming";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    kushell = {
      url = "github:mkuritsu/kushell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    frzscr = {
      url = "github:heather7283/frzscr";
      flake = false;
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      systems,
      ...
    }@inputs:
    let
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
          modules =
            [
              ./hosts/${hostname}/configuration.nix
              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.backupFileExtension = "backup";
                home-manager.extraSpecialArgs = { inherit inputs; };
                home-manager.users = userHomes;
              }
            ]
            ++ userModules
            ++ extraModules;
        };
    in
    {
      nixosConfigurations = {
        zaphkiel = mkNixOs "zaphkiel" {
          modules = [
            "common"
            "graphical"
            "gaming"
          ];
          users = [ "kuritsu" ];
        };

        camael = mkNixOs "camael" {
          modules = [
            "common"
            "graphical"
          ];
          users = [ "kuritsu" ];
        };

        fraxinus = mkNixOs "fraxinus" { };
      };

      formatter = eachSystem (pkgs: pkgs.nixfmt-rfc-style);

      packages = eachSystem (pkgs: {
        frzscr = pkgs.callPackage (import ./packages/frzscr.nix inputs) { };
      });

      templates = {
        rust = {
          description = "Rust starting template";
          path = ./templates/rust;
        };

        java = {
          description = "Java starting template";
          path = ./templates/java;
        };

        c-cpp = {
          description = "C/C++ starting template";
          path = ./templates/c-cpp;
        };

        python = {
          description = "Python starting template";
          path = ./templates/python;
        };

        minimal = {
          description = "Minimal starting template for other things";
          path = ./templates/minimal;
        };
      };
    };
}
