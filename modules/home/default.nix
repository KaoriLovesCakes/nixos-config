{globals, ...}: {
  imports = [
    ./desktop-environment
    ./networking
    ./services
    ./terminal
    ./typst

    ./btop.nix
    ./direnv.nix
    ./fzf.nix
    ./git.nix
    ./hyfetch.nix
    ./mimeapps.nix
    ./nixcord.nix
    ./packages.nix
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
}
