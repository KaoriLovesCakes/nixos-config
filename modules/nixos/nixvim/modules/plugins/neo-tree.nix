{
  keymaps = [
    {
      action = "<Cmd>Neotree<CR>";
      key = "<Leader>e";
      mode = "n";
      options = {
        noremap = true;
        desc = "Open explorer";
      };
    }
  ];
  plugins.neo-tree = {
    enable = true;
    filesystem.filteredItems.visible = true;
  };
}
