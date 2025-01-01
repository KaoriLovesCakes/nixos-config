_: {
  imports = [
    ./autocmd.nix
    ./extra-plugins.nix
    ./keymaps.nix
    ./plugins.nix
  ];

  clipboard.register = "unnamedplus";
  colorschemes.base16 = {
    enable = true;
    colorscheme = "nord";
  };
  globals = {
    mapleader = " ";
    maplocalleader = ",";
  };
  opts = {
    conceallevel = 2;
    cursorline = true;
    expandtab = true;
    foldlevel = 16;
    foldmethod = "indent";
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
}
