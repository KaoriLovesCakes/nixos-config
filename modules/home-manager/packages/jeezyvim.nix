{
  lib,
  pkgs,
  ...
}: {
  home.packages = [
    (pkgs.jeezyvim.nixvimExtend {
      colorschemes = {
        base16 = {
          enable = true;
          colorscheme = "catppuccin-frappe";
        };
        kanagawa.enable = pkgs.lib.mkForce false;
      };

      keymaps = [
        {
          mode = "x";
          action = "\"+y";
          key = "<Leader>y";
        }

        {
          mode = "";
          action = "\"+p";
          key = "<Leader>p";
        }
      ];

      opts.relativenumber = lib.mkForce false;

      plugins = {
        lsp.servers.clangd = {
          enable = true;
          cmd = ["clangd" "--fallback-style=webkit" "--offset-encoding=utf-16"];
        };
        lualine.theme = pkgs.lib.mkForce "base16";
        markdown-preview.enable = true;
        which-key.registrations = {
          "<leader>y" = "Copy to system clipboard";
          "<leader>p" = lib.mkForce "Paste from system clipboard";
        };
      };
    })
  ];
}
