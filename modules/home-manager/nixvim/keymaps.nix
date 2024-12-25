{
  programs.nixvim.keymaps = [
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
      action = "<cmd>Pick files<CR>";
      key = "<leader>f";
      mode = "n";
      options = {
        noremap = true;
        desc = "Find files";
      };
    }

    {
      action = "<cmd>Pick grep_live<CR>";
      key = "<leader>g";
      mode = "n";
      options = {
        noremap = true;
        desc = "Live grep";
      };
    }

    {
      action.__raw = ''
        function()
          require("menu").open("default")
        end
      '';

      key = "<leader>m";
      mode = "n";
      options = {
        noremap = true;
        desc = "Open menu";
      };
    }

    {
      action = "<Cmd>AssistantToggle<CR>";
      key = "<leader>a";
      mode = "n";
      options = {
        noremap = true;
        desc = "Toggle assistant";
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
      action.__raw = "require('substitute').operator";
      key = "s";
      mode = "n";
      options.noremap = true;
    }

    {
      action.__raw = "require('substitute').line";
      key = "ss";
      mode = "n";
      options.noremap = true;
    }

    {
      action.__raw = "require('substitute').eol";
      key = "S";
      mode = "n";
      options.noremap = true;
    }

    {
      action.__raw = "require('substitute').visual";
      key = "s";
      mode = "x";
      options.noremap = true;
    }

    {
      action.__raw = ''
        function()
          vim.cmd.exec '"normal! \\<RightMouse>"'
          local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
          require("menu").open(options, { mouse = true })
        end
      '';

      key = "<RightMouse>";
      mode = "n";
      options = {
        noremap = true;
        desc = "Open menu";
      };
    }
  ];
}
