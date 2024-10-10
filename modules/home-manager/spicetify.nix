{
  inputs,
  pkgs,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in {
  programs.spicetify = {
    enable = true;
    enabledExtensions = [
      spicePkgs.extensions.keyboardShortcut
      spicePkgs.extensions.popupLyrics
    ];
  };
}
