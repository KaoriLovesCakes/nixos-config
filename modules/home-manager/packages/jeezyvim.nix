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

      plugins = {
        lualine.theme = pkgs.lib.mkForce "base16";
        which-key.registrations = {
          "<leader>y" = "Copy to system clipboard";
          "<leader>p" = lib.mkForce "Paste from system clipboard";
        };
      };
    })
  ];
}
