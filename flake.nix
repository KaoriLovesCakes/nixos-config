{
  description = "My Nix config.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      #inputs.nixpkgs.follows = "nixpkgs";
    };

    jeezyvim = {
      url = "github:LGUG2Z/JeezyVim";
      #  #inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-alien.url = "github:thiagokokada/nix-alien";

    stylix = {
      url = "github:danth/stylix";
      #inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    hostname = "bqn-nixos";
    username = "_bqn";
    theme = "everforest";

    nixosConfigurations.${outputs.hostname} = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs outputs;};
      modules = [./configuration.nix];
    };
  };
}
