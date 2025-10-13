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
    optimise.automatic = true;
    settings =
      lib.recursiveUpdate {
        auto-optimise-store = true;
        connect-timeout = 0;
        experimental-features = [
          "flakes"
          "nix-command"
        ];
        trusted-users = ["root" globals.username];
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
