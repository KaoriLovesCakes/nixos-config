{
  imports = [
    ./autocmd.nix
    ./extra-plugins.nix
    ./keymaps.nix
    ./plugins.nix
  ];

  programs.nixvim = {
    enable = true;
    clipboard.register = "unnamedplus";
    defaultEditor = true;
    globals = {
      mapleader = " ";
      maplocalleader = ",";
    };
    opts = {
      conceallevel = 2;
      cursorline = true;
      expandtab = true;
      foldlevel = 80;
      list = true;
      listchars = {
        tab = "󰌒 ";
        trail = "•";
        nbsp = "␣";
      };
      showbreak = "↪ ";
      signcolumn = "number";
      swapfile = false;
      shiftwidth = 2;
      tabstop = 2;
    };
  };
}
