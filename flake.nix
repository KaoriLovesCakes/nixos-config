{
  description = "My Nix config.";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";

    # Honkers Railway Launcher
    aagl.url = "github:ezKEa/aagl-gtk-on-nix";

    # JeezyVim
    jeezyvim.url = "github:LGUG2Z/JeezyVim";

    # Stylix
    stylix.url = "github:danth/stylix";
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
