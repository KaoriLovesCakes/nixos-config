{
  keymaps = [
    {
      action = "<Cmd>Yazi toggle<CR>";
      key = "<Leader>e";
      mode = "n";
      options = {
        noremap = true;
        desc = "Open explorer";
      };
    }
  ];
  plugins.yazi.enable = true;
}
