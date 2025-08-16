{
  description = "mkuritsu's nixconfig";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default";
    mnw.url = "github:Gerg-L/mnw";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
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
      inputs.quickshell.follows = "quickshell";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.darwin.follows = "";
      inputs.home-manager.follows = "";
    };
    istannouncements = {
      url = "github:mkuritsu/ISTAnnouncements";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {self, ...} @ inputs: rec {
    lib = import ./lib.nix {inherit self inputs;};

    nixosConfigurations = lib.mkNixOsSystems {
      zaphkiel = {
        modules = [
          "common"
          "graphical"
          "gaming"
        ];
        users = ["kuritsu"];
      };

      camael = {
        modules = [
          "common"
          "graphical"
        ];
        users = ["kuritsu"];
      };

      fraxinus = {
        modules = [
          "common"
        ];
      };
    };

    packages = lib.eachSystem (pkgs: {
      reverb-toggle = pkgs.callPackage ./packages/reverb-toggle {};
    });

    formatter = lib.eachSystem (pkgs: pkgs.alejandra);

    templates = import ./templates;
  };
}
