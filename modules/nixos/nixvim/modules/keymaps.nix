{lib, ...}: {
  keymaps = [
    {
      action = "<gv";
      key = "<";
      mode = "v";
      options = {
        noremap = true;
        desc = "Indent left";
      };
    }

    {
      action = ">gv";
      key = ">";
      mode = "v";
      options = {
        noremap = true;
        desc = "Indent right";
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
      action = lib.nixvim.mkRaw ''
        function()
          if not vim.b.formatting_enabled then
            if vim.bo.filetype ~= "markdown" and vim.bo.filetype ~= "text" and vim.bo.filetype ~= "typst" and vim.bo.filetype ~= "" then
              if vim.fn.confirm("Filetype is " .. vim.bo.filetype .. ". Enable formatting?", "&Yes\n&No") == 2 then
                return
              end
            end
            vim.wo.colorcolumn = "+1"
            vim.wo.formatoptions = "tcqjwa"
            vim.wo.textwidth = 80
            vim.b.formatting_enabled = true
          else
            vim.wo.colorcolumn = nil
            vim.wo.formatoptions = "tcqj"
            vim.wo.textwidth = 0
            vim.b.formatting_enabled = nil
          end
        end
      '';
      key = "<Leader>tf";
      mode = "n";
      options = {
        noremap = true;
        desc = "Toggle formatting";
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
  ];
}
