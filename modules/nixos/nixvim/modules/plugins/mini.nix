{lib, ...}: {
  plugins.mini = {
    enable = true;
    mockDevIcons = true;
    modules = {
      icons = lib.nixvim.emptyTable;
      pick = lib.nixvim.emptyTable;
    };
  };
  keymaps = [
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
  ];
}
