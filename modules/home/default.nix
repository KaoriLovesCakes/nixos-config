{globals, ...}: {
  imports = [
    ./desktop-environment
    ./networking
    ./services
    ./terminal
    ./typst

    ./btop.nix
    ./direnv.nix
    ./discord.nix
    ./fzf.nix
    ./git.nix
    ./hyfetch.nix
    ./mimeapps.nix
    ./ollama.nix
    ./packages.nix
    ./polybar.nix
    ./spicetify.nix
    ./vscodium.nix
    ./yazi.nix
  ];

  home = {
    inherit (globals) username;
    stateVersion = "25.05";
  };
  programs.home-manager.enable = true;
}
