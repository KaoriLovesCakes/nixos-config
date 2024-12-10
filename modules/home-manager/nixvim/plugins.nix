{pkgs, ...}: {
  programs.nixvim = {
    extraConfigLua = ''
      require('substitute').setup()
    '';

    extraPlugins = [pkgs.vimPlugins.substitute-nvim];

    plugins = {
      cmp = {
        enable = true;
        settings = {
          snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
          sources = [
            # {name = "buffer";}
            {name = "calc";}
            # {name = "git";}
            {name = "luasnip";}
            {name = "nvim_lsp";}
            {name = "path";}
          ];
          mapping = {
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<C-k>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<C-j>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<Up>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<Down>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          };
        };
      };

      colorizer.enable = true;
      comment.enable = true;
      illuminate.enable = true;
      image.enable = true;
      indent-blankline.enable = true;

      lsp = {
        enable = true;
        servers = {
          clangd = {
            enable = true;
            cmd = ["clangd" "--fallback-style=microsoft" "--offset-encoding=utf-16"];
          };
          marksman.enable = true;
          nil_ls.enable = true;
          pyright.enable = true;
          typst_lsp.enable = true;
        };
      };

      lsp-format.enable = true;

      # lualine = {
      #   enable = true;
      #   settings.options.globalstatus = true;
      # };

      luasnip.enable = true;

      markdown-preview = {
        enable = true;
        settings.echo_preview_url = 1;
      };

      mini = {
        enable = true;
        mockDevIcons = true;
        modules.icons.__empty = null;
      };

      neorg = {
        enable = true;
        lazyLoading = true;
        modules = {
          "core.completion".config.engine = "nvim-cmp";
          "core.concealer".__empty = null;
          "core.defaults".__empty = null;
          "core.dirman".config = {
            workspaces.main = "~/notes";
            default_workspace = "main";
          };
          "core.latex.renderer".__empty = null;
        };
      };

      none-ls = {
        enable = true;
        sources = {
          diagnostics = {
            cppcheck.enable = true;
            markdownlint.enable = true;
            pylint = {
              enable = true;
              settings.extra_args = ["--disable=C0114,E0401"];
            };
            statix.enable = true;
          };
          formatting = {
            alejandra.enable = true;
            prettier.enable = true;
          };
        };
      };

      nvim-autopairs = {
        enable = true;
        settings.checkTs = true;
      };

      nvim-tree = {
        enable = true;
        git.ignore = false;
      };

      render-markdown.enable = true;
      telescope.enable = true;

      treesitter = {
        enable = true;
        folding = true;
        settings.highlight.enable = true;
      };

      treesitter-context.enable = true;
      typst-vim.enable = true;
      which-key.enable = true;
    };
  };
}
