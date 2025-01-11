{globals, ...}: {
  imports = [
    ./desktop-environment
    ./terminal

    ./direnv.nix
    ./fzf.nix
    ./git.nix
    ./hyfetch.nix
    ./mimeapps.nix
    ./polybar.nix
    ./rofi.nix
    ./spicetify.nix
    ./vscodium.nix
    ./yazi.nix
  ];

  home = {
    inherit (globals) username;
    sessionVariables = {
      NIXOS_CONFIG_DIR = globals.configDirectory;
      NIXPKGS_ALLOW_UNFREE = 1;
      TYPST_ROOT = globals.homeDirectory;
    };
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}
