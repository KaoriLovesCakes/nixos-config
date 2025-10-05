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
  ];

  services.flatpak.enable = true;

  environment.systemPackages = [
    inputs.zen-browser-flake.packages.${globals.system}.default
  ];

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
    config.allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [
        "cloudflare-warp"
        "discord"
        "minecraft-server"
        "nvidia-persistenced"
        "nvidia-settings"
        "nvidia-x11"
        "osu-lazer-bin"
        "spotify"
        "steam"
        "steam-unwrapped"
        "vscode"
      ];
    overlays = [
      inputs.nix-alien.overlays.default
      inputs.nix-vscode-extensions.overlays.default
      inputs.nur.overlays.default
    ];
  };

  users = {
    mutableUsers = false;
    users.${globals.username} = {
      isNormalUser = true;
      hashedPassword = "$y$j9T$BGckLddbijqsTyDxP4FZT0$L6Uapd.npeyzbJbbk2p7JqLHoYLUwc8ToxWJyOI9xy1";
      extraGroups = [
        "input"
        "networkmanager"
        "uinput"
        "video"
        "wheel"
      ];
    };
  };

  system.stateVersion = "25.05";
}
