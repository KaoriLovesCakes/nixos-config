{
  config,
  lib,
  ...
}: {
  extraConfigLua = lib.concatStrings (
    (lib.optional config.plugins.extraPlugins.fcitx5.enable ''
      require("fcitx5").setup({
        define_autocmd = true,
        imname = {
          norm = "keyboard-us-altgr-intl",
          cmd = "keyboard-us-altgr-intl",
          vis = "keyboard-us-altgr-intl",
          sel = "keyboard-us-altgr-intl",
          opr = "keyboard-us-altgr-intl",
          term = "keyboard-us-altgr-intl",
          lang = "keyboard-us-altgr-intl",
        },
        remember_prior = true,
      })
    '')
    ++ (lib.optional config.plugins.extraPlugins.img-clip.enable ''
      require("img-clip").setup({})
    '')
    ++ (lib.optional config.plugins.extraPlugins.lorem.enable ''
      require("lorem").opts({})
    '')
    ++ (lib.optional config.plugins.extraPlugins.substitute.enable ''
      require("substitute").setup({})
    '')
  );
}
