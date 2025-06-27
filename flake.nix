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
    quickshell = {
      url = "github:quickshell-mirror/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    kushell = {
      url = "github:mkuritsu/kushell";
      inputs.nixpkgs.follows = "nixpkgs";
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

      packages = eachSystem (pkgs: {
        hyprpaper-switcher = pkgs.callPackage ./packages/hyprpaper-switcher { };
        tmux-sessionizer = pkgs.callPackage ./packages/tmux-sessionizer { };
      });

      formatter = eachSystem (pkgs: pkgs.nixfmt-rfc-style);

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
