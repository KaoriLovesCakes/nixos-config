{
  config,
  globals,
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./modules/nixos
    ./hardware-configuration.nix
  ];

  environment.systemPackages = [
    inputs.zen-browser-flake.packages.${globals.system}.default
  ];

  hardware.enableAllFirmware = true;

  home-manager = {
    backupFileExtension = "backup";
    extraSpecialArgs = {inherit globals inputs pkgs;};
    useGlobalPkgs = true;
    users.${globals.username} = ./modules/home;
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
    overlays = [inputs.nix-alien.overlays.default];
  };

  programs.fuse.userAllowOther = true;
  time.timeZone = "Asia/Ho_Chi_Minh";

  users = {
    mutableUsers = false;
    users.${globals.username} = {
      isNormalUser = true;
      hashedPassword = "$y$j9T$Y7kA6d/QIhMHRtF4UW7ky/$juHiZ7BIq5drpMZcdkqmp8c5M8JdKxUQasaBYIv3OR3";
      extraGroups = [
        "networkmanager"
        "video"
        "wheel"
      ];
    };
  };

  system.stateVersion = "24.11";
}
