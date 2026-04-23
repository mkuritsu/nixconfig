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
      inputs.rust-overlay.inputs.nixpkgs.follows = "nixpkgs";
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
          "hardware/amd.nix"
          "desktop/hyprland.nix"
        ];
        users = ["kuritsu"];
      };

      camael = {
        system = "x86_64-linux";
        modules = [
          "common"
          "graphical"
          "desktop/hyprland.nix"
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
