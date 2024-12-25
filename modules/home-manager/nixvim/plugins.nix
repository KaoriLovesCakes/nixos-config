{
  config,
  pkgs,
  globals,
  ...
}: {
  programs.nixvim = {
    extraPackages = [
      pkgs.alejandra
      pkgs.markdownlint-cli2
      pkgs.ruff
      pkgs.typstyle
    ];

    plugins = {
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          snippet.expand = ''
            function(args)
              require('luasnip').lsp_expand(args.body)
            end
          '';
          sources = [
            {name = "luasnip";}
            {name = "neorg";}
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

      conform-nvim = {
        enable = true;
        settings = {
          format_on_save.__raw = "{}";
          formatters = {
            clang-format.prepend_args = ["--style=microsoft"];
            markdownlint-cli2.prepend_args = let
              configFile = builtins.toFile ".markdownlint.yaml" ''
                MD007:
                  indent: 4
              '';
            in ["--config" configFile];
          };
          formatters_by_ft = {
            "*" = ["trim_whitespace"];
            cpp = ["clang-format"];
            markdown = ["markdownlint-cli2"];
            nix = ["alejandra"];
            python = [
              "ruff_fix"
              "ruff_format"
              "ruff_organize_imports"
            ];
            typst = ["typstyle"];
          };
        };
      };

      guess-indent.enable = true;
      illuminate.enable = true;
      image.enable = true;
      indent-blankline.enable = true;

      lsp = {
        enable = true;
        servers = {
          clangd.enable = true;
          markdown_oxide.enable = true;
          nil_ls.enable = true;
          pyright.enable = true;
          tinymist = {
            enable = true;
            extraOptions.offset_encoding = "utf-8";
          };
        };
      };

      luasnip.enable = true;

      mini = {
        enable = true;
        mockDevIcons = true;
        modules = {
          icons = config.lib.nixvim.emptyTable;
          pick = config.lib.nixvim.emptyTable;
        };
      };

      # neorg = {
      #   enable = true;
      #   settings.load = {
      #     "core.completion".config.engine = "nvim-cmp";
      #     "core.concealer" = config.lib.nixvim.emptyTable;
      #     "core.defaults" = config.lib.nixvim.emptyTable;
      #     "core.dirman".config = {
      #       workspaces.main = globals.notesDirectory;
      #       default_workspace = "main";
      #     };
      #     "core.journal".config.strategy = "flat";
      #     "core.latex.renderer" = config.lib.nixvim.emptyTable;
      #     # "external.hop-extras" = config.lib.nixvim.emptyTable;
      #     # "external.templates".config.templates_dir = "${globals.notesDirectory}/templates";
      #   };
      # };

      nvim-autopairs = {
        enable = true;
        settings.checkTs = true;
      };

      nvim-tree = {
        enable = true;
        git.ignore = false;
      };

      obsidian = {
        enable = true;
        settings = {
          daily_notes = {
            folder = "journals";
            template = "journal_template.md";
          };
          follow_url_func = ''
            function(url)
              vim.fn.jobstart({"xdg-open", url})
            end
          '';
          templates.subdir = "templates";
          workspaces = [
            {
              name = "main";
              path = globals.notesDirectory;
            }
          ];
        };
      };

      telescope.enable = true;

      treesitter = {
        enable = true;
        # grammarPackages =
        #   pkgs.vimPlugins.nvim-treesitter.passthru.allGrammars
        #   ++ [
        #     (pkgs.tree-sitter.buildGrammar {
        #       language = "norg-meta";
        #       fixupPhase = ''
        #         mkdir -p $out/queries/norg-meta
        #         mv $out/queries/*.scm $out/queries/norg-meta/
        #       '';
        #       src = pkgs.fetchFromGitHub {
        #         owner = "nvim-neorg";
        #         repo = "tree-sitter-norg-meta";
        #         rev = "v0.1.0";
        #         hash = "sha256-8qSdwHlfnjFuQF4zNdLtU2/tzDRhDZbo9K54Xxgn5+8=";
        #       };
        #       version = "0.1.0";
        #     })
        #   ];
        folding = true;
        settings = {
          highlight.enable = true;
          indent.enable = true;
        };
      };

      treesitter-context.enable = true;
      typst-vim.enable = true;

      which-key = {
        enable = true;
        settings.spec = [
          {
            __unkeyed = "<leader>t";
            group = "Toggle";
          }
        ];
      };
    };
  };
}
