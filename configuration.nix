{
  inputs,
  global,
  pkgs,
  ...
}: {
  imports = [
    ./modules/nixos
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
    inputs.aagl-gtk-on-nix.nixosModules.default
    inputs.flake-programs-sqlite.nixosModules.programs-sqlite
    inputs.stylix.nixosModules.stylix
  ];

  environment.systemPackages = [
    pkgs.git
    inputs.zen-browser-flake.packages.${global.system}.default
  ];

  hardware.enableAllFirmware = true;

  home-manager = {
    extraSpecialArgs = {inherit inputs global pkgs;};
    sharedModules = [
      inputs.nixvim.homeManagerModules.nixvim
      inputs.plasma-manager.homeManagerModules.plasma-manager
      inputs.spicetify-nix.homeManagerModules.default
    ];
    useGlobalPkgs = true;
    users.${global.username} = ./home.nix;
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

  users.users.${global.username} = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "video"
      "wheel"
    ];
  };

  system.stateVersion = "24.11";
}
