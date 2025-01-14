{
  plugins.precognition = {
    enable = true;
    settings.startVisible = false;
  };
  keymaps = [
    {
      action = "<Cmd>Precognition toggle<CR>";
      key = "<Leader>tp";
      mode = "n";
      options = {
        noremap = true;
        desc = "Toggle precognition";
      };
    }
  ];
}
