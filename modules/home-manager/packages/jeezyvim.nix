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
          colorscheme = "everforest";
        };
        kanagawa.enable = pkgs.lib.mkForce false;
      };

      extraConfigLua = ''
        require('render-markdown').setup({})
      '';

      extraPlugins = [
        (pkgs.vimUtils.buildVimPlugin {
          name = "render-markdown";
          src = pkgs.fetchFromGitHub {
            owner = "MeanderingProgrammer";
            repo = "markdown.nvim";
            rev = "78ef39530266b3a0736c48b46c3f5d1ab022c7db";
            hash = "sha256-mddnBvIrekHh60Ix6qIYAnv10Mu40LamGI47EXk9wSo=";
          };
        })
      ];

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
        # friendly-snippets.enable = true;
        lsp.servers = {
          clangd = {
            enable = true;
            cmd = ["clangd" "--fallback-style=webkit" "--offset-encoding=utf-16"];
          };
          pylsp.enable = false;
          pyright.enable = pkgs.lib.mkForce false;
        };
        lualine.theme = pkgs.lib.mkForce "base16";
        luasnip.extraConfig.enable_autosnippets = pkgs.lib.mkForce false;
        markdown-preview.enable = true;
        molten.enable = true;
        which-key.registrations = {
          "<leader>y" = "Copy to system clipboard";
          "<leader>p" = lib.mkForce "Paste from system clipboard";
        };
      };
    })
  ];
}
