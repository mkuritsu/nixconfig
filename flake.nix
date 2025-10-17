{
  description = "mkuritsu's nixconfig";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    dotfiles.url = "git+file:users/kuritsu/dotfiles";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
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
    watt = {
      url = "github:notashelf/watt";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell = {
      url = "git+https://git.outfoxxed.me/quickshell/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dankmaterialshell = {
      url = "github:avengemedia/dankmaterialshell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.quickshell.follows = "quickshell";
    };
  };

  outputs =
    { self, ... }@inputs:
    rec {
      lib = import ./lib.nix { inherit self inputs; };

      nixosConfigurations = lib.mkNixOsSystems {
        zaphkiel = {
          modules = [
            "common"
            "graphical"
            "gaming"
            "hardware/amd.nix"
            "desktop/hyprland.nix"
          ];
          users = [ "kuritsu" ];
        };

        camael = {
          modules = [
            "common"
            "graphical"
            "desktop/hyprland.nix"
          ];
          users = [ "kuritsu" ];
        };

        fraxinus = {
          modules = [
            "common"
          ];
        };
      };

      packages = lib.eachSystem (pkgs: {
        reverb-toggle = pkgs.callPackage ./packages/reverb-toggle { };
        setup-script = pkgs.writeShellScriptBin "nixos-setup-script" (builtins.readFile ./setup.sh);
      });

      templates = import ./templates;
    };
}
