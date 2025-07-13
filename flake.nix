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
    { self, ... }@inputs:
    rec {
      lib = import ./lib.nix { inherit self inputs; };

      nixosConfigurations = {
        zaphkiel = lib.mkNixOs "zaphkiel" {
          modules = [
            "common"
            "graphical"
            "gaming"
          ];
          users = [ "kuritsu" ];
        };

        camael = lib.mkNixOs "camael" {
          modules = [
            "common"
            "graphical"
          ];
          users = [ "kuritsu" ];
        };

        fraxinus = lib.mkNixOs "fraxinus" { };
      };

      formatter = lib.eachSystem (pkgs: pkgs.nixfmt-rfc-style);

      packages = lib.eachSystem (pkgs: {
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
