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
      action = "<cmd>ToggleTerm<CR>";
      key = "<C-t>";
      mode = ["n" "t"];
      options = {
        noremap = true;
        desc = "Toggle terminal";
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
      key = "<leader>ff";
      mode = "n";
      options = {
        noremap = true;
        desc = "Find files";
      };
    }

    {
      action = "<cmd>Telescope live_grep<CR>";
      key = "<leader>fg";
      mode = "n";
      options = {
        noremap = true;
        desc = "Live grep";
      };
    }

    {
      action.__raw = "require('substitute').operator";
      key = "s";
      mode = "n";
      options = {
        noremap = true;
      };
    }

    {
      action.__raw = "require('substitute').line";
      key = "ss";
      mode = "n";
      options = {
        noremap = true;
      };
    }

    {
      action.__raw = "require('substitute').eol";
      key = "S";
      mode = "n";
      options = {
        noremap = true;
      };
    }

    {
      action.__raw = "require('substitute').visual";
      key = "s";
      mode = "x";
      options = {
        noremap = true;
      };
    }
  ];
}
