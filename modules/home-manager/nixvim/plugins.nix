{
  programs.nixvim.plugins = {
    bufferline = {
      enable = true;
      settings.options.offsets = [
        {
          filetype = "NvimTree";
          text = "Explorer";
          highlight = "PanelHeading";
        }
      ];
    };
    cmp = {
      enable = true;
      settings = {
        snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
        sources = [
          {name = "buffer";}
          {name = "calc";}
          {name = "git";}
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
        nil-ls.enable = true;
        pyright.enable = true;
        typst-lsp.enable = true;
      };
    };
    lsp-format.enable = true;
    lualine = {
      enable = true;
      globalstatus = true;
    };
    luasnip.enable = true;
    markdown-preview = {
      enable = true;
      settings.echo_preview_url = true;
    };
    none-ls = {
      enable = true;
      sources = {
        diagnostics = {
          cppcheck.enable = true;
          markdownlint.enable = true;
          pylint = {
            enable = true;
            settings.extra_args = [
              "--disable=C0114,E0401"
            ];
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
    nvim-colorizer.enable = true;
    nvim-tree = {
      enable = true;
      openOnSetup = true;
      git.ignore = false;
    };
    toggleterm = {
      enable = true;
      settings = {
        direction = "vertical";
        size = ''
          function(term)
            if term.direction == "horizontal" then
              return vim.o.lines * 0.25
            elseif term.direction == "vertical" then
              return vim.o.columns * 0.5
            end
          end
        '';
      };
    };
    treesitter = {
      enable = true;
      folding = true;
    };
    treesitter-context.enable = true;
    typst-vim.enable = true;
    which-key.enable = true;
  };
}
