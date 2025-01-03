{
  globals,
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./modules/nixos
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
    inputs.aagl-gtk-on-nix.nixosModules.default
    inputs.disko.nixosModules.disko
    inputs.flake-programs-sqlite.nixosModules.programs-sqlite
    inputs.impermanence.nixosModules.impermanence
    inputs.nixvim.nixosModules.nixvim
    inputs.stylix.nixosModules.stylix
  ];

  environment.systemPackages = [
    inputs.zen-browser-flake.packages.${globals.system}.default
  ];

  hardware.enableAllFirmware = true;

  home-manager = {
    extraSpecialArgs = {inherit globals inputs pkgs;};
    sharedModules = [
      inputs.impermanence.nixosModules.home-manager.impermanence
      inputs.plasma-manager.homeManagerModules.plasma-manager
      inputs.spicetify-nix.homeManagerModules.default
    ];
    useGlobalPkgs = true;
    users.${globals.username} = ./modules/home-manager;
  };

  nix = {
    extraOptions = ''
      extra-substituters = https://devenv.cachix.org
      extra-trusted-public-keys = devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw= nixpkgs-python.cachix.org-1:hxjI7pFxTyuTHn2NkvWCrAUcNZLNS3ZAvfYNuYifcEU=
      trusted-users = root ${globals.username}
    '';
    optimise.automatic = true;
    settings =
      lib.recursiveUpdate {
        auto-optimise-store = true;
        experimental-features = [
          "flakes"
          "nix-command"
        ];
      }
      inputs.aagl-gtk-on-nix.nixConfig;
  };

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      inputs.nix-alien.overlays.default
      (final: prev: {
        rclone = prev.rclone.overrideAttrs (old: {
          version = "with-iclouddrive";
          src = pkgs.fetchFromGitHub {
            owner = "rclone";
            repo = "rclone";
            rev = "500698c5be5394301f30eaed1c4def24299bf7eb";
            hash = "sha256-ZJ7sMm3zM822WE4wFnB5v/PM25MSoMJcZ8i2J4Y7cA0=";
          };
          vendorHash = "sha256-JyfDNbL1VAfcVg3GlFVTP97Kw/8h4d8l0+irloLxnqs=";
        });
      })
    ];
  };

  programs.fuse.userAllowOther = true;
  time.timeZone = "Asia/Ho_Chi_Minh";

  users.users.${globals.username} = {
    isNormalUser = true;
    initialPassword = "correct-horse-battery-staple";
    extraGroups = [
      "networkmanager"
      "video"
      "wheel"
    ];
  };

  system.stateVersion = "24.11";
}
