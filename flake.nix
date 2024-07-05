{
  description = "My Nix config.";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Honkers Railway Launcher
    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      #inputs.nixpkgs.follows = "nixpkgs";
    };

    # JeezyVim
    jeezyvim = {
      url = "github:LGUG2Z/JeezyVim";
      #  #inputs.nixpkgs.follows = "nixpkgs";
    };

    # Stylix
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
