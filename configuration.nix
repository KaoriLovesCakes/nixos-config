{
  inputs,
  outputs,
  pkgs,
  ...
}: {
  imports = [
    ./modules/nixos
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  environment = {
    systemPackages = [pkgs.git];
    variables = {
      EDITOR = "nvim";
      GLFW_IM_MODULE = "ibus";
    };
  };

  hardware.enableAllFirmware = true;

  home-manager = {
    extraSpecialArgs = {inherit inputs outputs pkgs;};
    sharedModules = [
      inputs.nixvim.homeManagerModules.nixvim
      inputs.plasma-manager.homeManagerModules.plasma-manager
    ];
    useGlobalPkgs = true;
    users.${outputs.username} = import ./home.nix;
  };

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    optimise.automatic = true;
    settings.experimental-features = ["nix-command" "flakes"];
  };

  nixpkgs = {
    overlays = [
      inputs.nix-alien.overlays.default
    ];
    config.allowUnfree = true;
  };

  users.users.${outputs.username} = {
    isNormalUser = true;
    description = outputs.username;
    extraGroups = ["networkmanager" "wheel" "video"];
  };

  system.stateVersion = "24.11";
}
