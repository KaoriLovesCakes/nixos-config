{
  lib,
  pkgs,
  ...
}: {
  extraConfigLua = "require('substitute').setup({})";
  extraPlugins = [pkgs.vimPlugins.substitute-nvim];
  keymaps = [
    {
      action = lib.nixvim.mkRaw "require('substitute').visual";
      key = "<C-s>";
      mode = "v";
      options = {
        noremap = true;
        desc = "Substitute";
      };
    }
  ];
}
