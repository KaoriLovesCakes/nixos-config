{
  lib,
  pkgs,
  ...
}: {
  extraConfigLua = "require('img-clip').setup({})";
  extraPlugins = [pkgs.vimPlugins.img-clip-nvim];
  keymaps = [
    {
      action = lib.nixvim.mkRaw ''
        function()
          if vim.bo.filetype == "typst" then
            require("img-clip").paste_image({
              file_name = tostring(os.time()),
              insert_mode_after_paste = false,
              prompt_for_file_name = false,
              relative_to_current_file = true,
              template = '#figure(image("$FILE_PATH")) <fig-$LABEL>',
            })
            return
          end

          require("img-clip").paste_image({
            file_name = tostring(os.time()),
            prompt_for_file_name = false,
            relative_to_current_file = true,
          })
        end
      '';
      key = "<Leader>i";
      mode = "n";
      options = {
        noremap = true;
        desc = "Paste image";
      };
    }
  ];
}
