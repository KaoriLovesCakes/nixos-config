{
  lib,
  pkgs,
  ...
}: {
  programs.starship = let
    getPreset = name: (
      builtins.removeAttrs (
        builtins.fromTOML (
          builtins.readFile "${pkgs.starship}/share/starship/presets/${name}.toml"
        )
      ) ["\"$schema\""]
    );
  in {
    enable = true;
    settings =
      lib.recursiveUpdate (
        lib.mergeAttrsList [
          (getPreset "plain-text-symbols")
        ]
      )
      {
      };
  };
}
