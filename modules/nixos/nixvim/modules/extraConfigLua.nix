{
  config,
  lib,
  ...
}: {
  extraConfigLua = lib.concatStringsSep "\n" [
    (lib.optionalString config.plugins.extraPlugins.nvzone.floaterm.enable ''
      require("floaterm").setup({
        border = true,
      })
    '')
    (lib.optionalString config.plugins.extraPlugins.lorem.enable ''
      require("lorem").opts({})
    '')
    (lib.optionalString config.plugins.extraPlugins.substitute.enable ''
      require("substitute").setup({})
    '')
  ];
}
