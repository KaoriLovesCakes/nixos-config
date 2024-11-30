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
      action.__raw = ''
        function()
          vim.diagnostic.enable(not vim.diagnostic.is_enabled())
        end
      '';
      key = "<leader>d";
      mode = "n";
      options = {
        noremap = true;
        desc = "Toggle diagnostic";
      };
    }

    {
      action = "<cmd>NvimTreeFindFileToggle<CR>";
      key = "<leader>e";
      mode = "n";
      options = {
        noremap = true;
        desc = "Toggle explorer";
      };
    }

    {
      action = "<cmd>Telescope find_files<CR>";
      key = "<leader>f";
      mode = "n";
      options = {
        noremap = true;
        desc = "Find files";
      };
    }

    {
      action = "<cmd>Telescope live_grep<CR>";
      key = "<leader>g";
      mode = "n";
      options = {
        noremap = true;
        desc = "Live grep";
      };
    }

    {
      action = ":q!<CR>";
      key = "<leader>q";
      mode = "n";
      options = {
        noremap = true;
        desc = "Force quit";
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
  ];
}
