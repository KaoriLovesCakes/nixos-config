{
  config,
  lib,
  ...
}: {
  extraConfigLua = lib.concatStringsSep "\n" [
    (lib.optionalString config.plugins.extraPlugins.iron.enable ''
      require("iron.core").setup({
        config = {
          repl_definition = {
            python = {
              command = { "ipython", "--matplotlib=kitcat" },
            },
          },
          repl_open_cmd = require("iron.view").split.vertical.botright(0.4),
        },
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
