{
  inputs = {
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.darwin.follows = "";
      inputs.home-manager.follows = "";
    };
    viu = {
      url = "github:viu-media/viu";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    istannouncements = {
      url = "github:mkuritsu/ISTAnnouncements";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
