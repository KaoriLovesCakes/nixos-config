{
  globals,
  inputs,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${globals.system};
in {
  programs.spicetify = {
    enable = true;
    enabledExtensions = [
      spicePkgs.extensions.keyboardShortcut
      spicePkgs.extensions.popupLyrics
    ];
  };
}
