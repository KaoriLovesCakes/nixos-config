{
  config,
  lib,
  ...
}: {
  keymaps =
    [
      {
        action = "<gv";
        key = "<";
        mode = "v";
        options = {
          desc = "Indent left";
          noremap = true;
          silent = true;
        };
      }

      {
        action = ">gv";
        key = ">";
        mode = "v";
        options = {
          desc = "Indent right";
          noremap = true;
          silent = true;
        };
      }

      {
        action = lib.nixvim.mkRaw ''
          function()
            if vim.wo.conceallevel == 0 then
              vim.wo.conceallevel = 2
            else
              vim.wo.conceallevel = 0
            end
          end
        '';

        key = "<Leader>tc";
        mode = "n";
        options = {
          noremap = true;
          desc = "Toggle conceal";
        };
      }

      {
        action = lib.nixvim.mkRaw ''
          function()
            vim.diagnostic.enable(not vim.diagnostic.is_enabled())
          end
        '';
        key = "<Leader>td";
        mode = "n";
        options = {
          noremap = true;
          desc = "Toggle diagnostic";
        };
      }

      {
        action = "<Cmd>set number!<CR>";
        key = "<Leader>tn";
        mode = "n";
        options = {
          noremap = true;
          desc = "Toggle number";
        };
      }
    ]
    ++ lib.optionals config.plugins.neo-tree.enable [
      {
        action = "<Cmd>Neotree<CR>";
        key = "<Leader>e";
        mode = "n";
        options = {
          noremap = true;
          desc = "Open explorer";
        };
      }
    ]
    ++ lib.optionals (config.plugins.snacks.enable && (builtins.hasAttr "picker" config.plugins.snacks.settings)) [
      {
        action = lib.nixvim.mkRaw ''
          function()
            Snacks.picker.files()
          end
        '';
        key = "<Leader>pf";
        mode = "n";
        options = {
          noremap = true;
          desc = "Files";
        };
      }

      {
        action = lib.nixvim.mkRaw ''
          function()
            Snacks.picker.lines()
          end
        '';
        key = "<Leader>pl";
        mode = "n";
        options = {
          noremap = true;
          desc = "Lines";
        };
      }

      {
        action = lib.nixvim.mkRaw ''
          function()
            Snacks.picker.grep()
          end
        '';
        key = "<Leader>pg";
        mode = "n";
        options = {
          noremap = true;
          desc = "Grep";
        };
      }
    ]
    ++ lib.optionals config.plugins.extraPlugins.img-clip.enable [
      {
        action = lib.nixvim.mkRaw ''
          function()
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
    ]
    ++ lib.optionals config.plugins.extraPlugins.substitute.enable [
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
