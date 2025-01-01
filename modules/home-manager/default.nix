{globals, ...}: {
  imports = [
    ./desktop-environment
    ./disk
    ./terminal

    ./direnv.nix
    ./fzf.nix
    ./git.nix
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
      NIXPKGS_ALLOW_UNFREE = 1;
      TYPST_ROOT = globals.homeDirectory;
    };
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}
