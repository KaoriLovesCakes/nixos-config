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
    inputs.aagl.nixosModules.default
    inputs.flake-programs-sqlite.nixosModules.programs-sqlite
  ];

  environment.systemPackages = [
    pkgs.git
    inputs.zen-browser.packages."${outputs.system}".default
  ];

  hardware.enableAllFirmware = true;

  home-manager = {
    extraSpecialArgs = {inherit inputs outputs pkgs;};
    sharedModules = [
      inputs.nixvim.homeManagerModules.nixvim
      inputs.plasma-manager.homeManagerModules.plasma-manager
    ];
    useGlobalPkgs = true;
    users.${outputs.username} = ./home.nix;
  };

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    optimise.automatic = true;
    settings.experimental-features = [
      "flakes"
      "nix-command"
    ];
  };

  nixpkgs = {
    overlays = [inputs.nix-alien.overlays.default];
    config.allowUnfree = true;
  };

  users.users.${outputs.username} = {
    isNormalUser = true;
    description = outputs.username;
    extraGroups = [
      "networkmanager"
      "video"
      "wheel"
    ];
  };

  system.stateVersion = "24.11";
}
