{pkgs, ...}: {
  imports = [
    ./keymaps.nix
    ./plugins.nix
  ];

  home.packages = [pkgs.ripgrep];

  programs.nixvim = {
    enable = true;
    clipboard.register = "unnamedplus";
    defaultEditor = true;
    globals = {
      mapleader = " ";
      maplocalleader = ",";
    };
    opts = {
      conceallevel = 3;
      cursorline = true;
      expandtab = true;
      foldlevel = 80;
      list = true;
      listchars = {
        tab = "󰌒 ";
        trail = "•";
        nbsp = "␣";
      };
      # number = true;
      showbreak = "↪ ";
      signcolumn = "number";
      swapfile = false;
      shiftwidth = 2;
      tabstop = 2;
    };
  };
}
