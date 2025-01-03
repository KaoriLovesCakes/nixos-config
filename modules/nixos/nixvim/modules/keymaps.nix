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
      key = "<leader>fp";
      mode = "n";
      options = {
        noremap = true;
        desc = "Format paragraph";
      };
    }

    {
      action = "<cmd>Pick files<CR>";
      key = "<leader>pf";
      mode = "n";
      options = {
        noremap = true;
        desc = "Find files";
      };
    }

    {
      action = "<cmd>Pick grep_live<CR>";
      key = "<leader>pg";
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

      key = "<leader>tc";
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
      key = "<leader>td";
      mode = "n";
      options = {
        noremap = true;
        desc = "Toggle diagnostic";
      };
    }

    {
      action = "<cmd>set number!<CR>";
      key = "<leader>tn";
      mode = "n";
      options = {
        noremap = true;
        desc = "Toggle number";
      };
    }

    {
      action = "<cmd>NvimTreeFindFileToggle<CR>";
      key = "<leader>tt";
      mode = "n";
      options = {
        noremap = true;
        desc = "Toggle tree";
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
      key = "<leader>;";
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
