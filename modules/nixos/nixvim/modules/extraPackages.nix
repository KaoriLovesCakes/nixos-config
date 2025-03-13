{
  config,
  lib,
  pkgs,
  ...
}: {
  extraPackages =
    lib.lists.optionals config.plugins.conform-nvim.enable [
      pkgs.alejandra
      pkgs.fixjson
      pkgs.nodePackages.prettier
      pkgs.ruff
      pkgs.typstyle
    ]
    ++ lib.lists.optionals (config.plugins.snacks.enable && (builtins.hasAttr "image" config.plugins.snacks.settings)) [
      pkgs.ghostscript
      pkgs.imagemagick
      pkgs.mermaid-cli
      pkgs.tectonic
    ];
}
