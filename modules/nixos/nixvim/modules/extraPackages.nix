{
  config,
  lib,
  pkgs,
  ...
}: {
  extraPackages = lib.flatten [
    (lib.optionals config.plugins.conform-nvim.enable [
      pkgs.alejandra
      pkgs.fixjson
      pkgs.nodePackages.prettier
      pkgs.ruff
      pkgs.typstyle
    ])
    (lib.optionals config.plugins.fugit2.enable [
      pkgs.libgit2
    ])
    (lib.optionals (config.plugins.snacks.enable && (builtins.hasAttr "image" config.plugins.snacks.settings)) [
      pkgs.ghostscript
      pkgs.imagemagick
      pkgs.mermaid-cli
      pkgs.tectonic
    ])
  ];
}
