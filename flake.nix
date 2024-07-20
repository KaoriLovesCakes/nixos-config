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
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #firefox = {
    #  url = "github:nix-community/flake-firefox-nightly";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};

    jeezyvim = {
      url = "github:LGUG2Z/JeezyVim";
      #inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-alien = {
      url = "github:thiagokokada/nix-alien";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
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
    system = "x86_64-Linux";
    theme = "everforest";

    nixosConfigurations.${outputs.hostname} = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs outputs;};
      modules = [./configuration.nix];
    };
  };
}
