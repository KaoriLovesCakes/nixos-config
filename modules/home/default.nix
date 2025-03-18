{
  globals,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./desktop-environment
    ./networking
    ./services
    ./terminal
    ./typst

    ./direnv.nix
    ./fzf.nix
    ./git.nix
    ./hyfetch.nix
    ./mimeapps.nix
    ./nixcord.nix
    ./polybar.nix
    ./spicetify.nix
    ./vscodium.nix
    ./yazi.nix
  ];

  home = {
    inherit (globals) username;
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;

  # Workaround
  qt = {
    enable = true;
    platformTheme.package = with pkgs.kdePackages; [
      plasma-integration
      systemsettings
    ];
    style = lib.mkForce {
      package = pkgs.kdePackages.breeze;
      name = "Breeze";
    };
  };
  systemd.user.sessionVariables.QT_QPA_PLATFORMTHEME = lib.mkForce "kde";
}
