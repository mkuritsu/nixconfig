{
  description = "mkuritsu's nixconfig";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
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
    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      mkNixOs = { hostname, users, modules }: 
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
          specialArgs = { inherit inputs; };
          modules =
            [
              ./hosts/${hostname}/configuration.nix
              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.backupFileExtension = "bak";
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
        yggdrasil = mkNixOs {
          hostname = "yggdrasil";
          modules = [
            "common"
            "graphical"
            "gaming"
            "amd.nix"
          ];
          users = [ "kuritsu" ];
        };

        asuka = mkNixOs {
          hostname = "asuka";
          modules = [
            "common"
            "graphical"
          ];
          users = [ "kuritsu" ];
        };
      };

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
      };
    };
}
