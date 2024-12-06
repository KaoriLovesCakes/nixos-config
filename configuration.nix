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
    inputs.flake-programs-sqlite.nixosModules.programs-sqlite
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
    extraOptions = ''
      extra-substituters = https://devenv.cachix.org
      extra-trusted-public-keys = devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw= nixpkgs-python.cachix.org-1:hxjI7pFxTyuTHn2NkvWCrAUcNZLNS3ZAvfYNuYifcEU=
      trusted-users = root ${global.username}
    '';
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 3d";
    };
    optimise.automatic = true;
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "flakes"
        "nix-command"
      ];
    };
  };

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Asia/Ho_Chi_Minh";

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
