{
  keymaps = [
    {
      action = "<gv";
      key = "<";
      mode = "v";
      options = {
        noremap = true;
        silent = true;
        desc = "Indent left";
      };
    }

    {
      action = ">gv";
      key = ">";
      mode = "v";
      options = {
        noremap = true;
        silent = true;
        desc = "Indent right";
      };
    }

    {
      action = "vipgq$";
      key = "<Leader>fp";
      mode = "n";
      options = {
        noremap = true;
        desc = "Format paragraph";
      };
    }

    {
      action = "<Cmd>Pick files<CR>";
      key = "<Leader>pf";
      mode = "n";
      options = {
        noremap = true;
        desc = "Find files";
      };
    }

    {
      action = "<Cmd>Pick grep_live<CR>";
      key = "<Leader>pg";
      mode = "n";
      options = {
        noremap = true;
        desc = "Live grep";
      };
    }

    {
      action.__raw = ''
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
      action.__raw = ''
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

    {
      action = "<Cmd>NvimTreeFindFileToggle<CR>";
      key = "<Leader>tt";
      mode = "n";
      options = {
        noremap = true;
        desc = "Toggle tree";
      };
    }

    {
      action.__raw = ''
        function()
          local lines = vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getpos("."))
          local bufnr = vim.api.nvim_create_buf(false, true)
          vim.api.nvim_buf_set_lines(bufnr, 0, -1, true, lines)
          vim.api.nvim_set_current_buf(bufnr)
        end
      '';
      key = "<Leader>nb";
      mode = "v";
      options = {
        noremap = true;
        desc = "Open in new buffer";
      };
    }

    {
      action.__raw = "require('substitute').visual";
      key = "<C-s>";
      mode = "v";
      options = {
        noremap = true;
        desc = "Substitute";
      };
    }

    {
      action.__raw = "require('dropbar.api').pick";
      key = "<Leader>;";
      mode = "n";
      options = {
        noremap = true;
        desc = "Pick symbols in winbar";
      };
    }

    {
      action.__raw = "require('dropbar.api').goto_context_start";
      key = "[;";
      mode = "n";
      options = {
        noremap = true;
        desc = "Go to start of current context";
      };
    }

    {
      action.__raw = "require('dropbar.api').select_next_context";
      key = "];";
      mode = "n";
      options = {
        noremap = true;
        desc = "Select next context";
      };
    }
  ];
}
