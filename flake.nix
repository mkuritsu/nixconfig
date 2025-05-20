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
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];

      forAllSystems =
        fn:
        nixpkgs.lib.genAttrs systems (
          system:
          let
            pkgs = nixpkgs.legacyPackages.${system};
          in
          fn pkgs
        );

      mkNixOs =
        {
          hostname,
          users,
          modules,
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

      formatter = forAllSystems (pkgs: pkgs.nixfmt-rfc-style);

      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            nixfmt-rfc-style
            nixd
          ];
        };
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
      };
    };
}
