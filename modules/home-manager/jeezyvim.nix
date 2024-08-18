{
  lib,
  outputs,
  pkgs,
  ...
}: {
  home.packages = [
    (pkgs.jeezyvim.extend {
      colorschemes = {
        #base16 = {
        #  enable = true;
        #  colorscheme = "${outputs.theme}";
        #};
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

      opts.relativenumber = lib.mkForce false;

      plugins = {
        lsp.servers = {
          clangd = {
            enable = true;
            cmd = ["clangd" "--fallback-style=microsoft" "--offset-encoding=utf-16"];
          };
          pylsp.enable = true;
          pyright.enable = pkgs.lib.mkForce false;
        };
        lualine.theme = pkgs.lib.mkForce "base16";
        markdown-preview.enable = true;
        nvim-tree.git.ignore = false;
        nvim-ufo.enable = true;
        treesitter = {
          folding = true;
          settings.indent.enable = true;
        };
        which-key.registrations = {
          "<leader>y" = "Copy to system clipboard";
          "<leader>p" = lib.mkForce "Paste from system clipboard";
        };
      };
    })
  ];
}
