{
  description = "mkuritsu's nixconfig";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        darwin.follows = "";
        home-manager.follows = "";
        systems.follows = "systems";
      };
    };
    helium-browser = {
      url = "github:amaanq/helium-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dms = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {self, ...} @ inputs: rec {
    lib = import ./lib.nix {inherit self inputs;};

    nixosConfigurations = lib.mkNixOsSystems {
      zaphkiel = {
        system = "x86_64-linux";
        modules = [
          "common"
          "graphical"
          "gaming"
          "hardware/amdgpu.nix"
        ];
        users = ["kuritsu"];
      };

      camael = {
        system = "x86_64-linux";
        modules = [
          "common"
          "graphical"
          "hardware/intelgpu.nix"
        ];
        users = ["kuritsu"];
      };

      fraxinus = {
        system = "aarch64-linux";
        modules = [
          "common"
        ];
        users = ["kuritsu"];
      };
    };

    formatter = lib.eachSystem (pkgs: pkgs.alejandra);

    packages = lib.eachSystem (pkgs: {
      setup-script = pkgs.writeShellScriptBin "nixos-setup-script" (builtins.readFile ./setup.sh);
    });

    templates = import ./templates;
  };
}
