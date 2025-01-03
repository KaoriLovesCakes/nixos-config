{
  config,
  lib,
  pkgs,
  ...
}: {
  extraPackages = [
    pkgs.alejandra
    pkgs.markdownlint-cli2
    # pkgs.nodePackages.prettier
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
    competitest.enable = true;

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
          # prettier.prepend_args = let
          #   configFile = builtins.toFile ".prettierrc.yaml" ''
          #     tabWidth: 4
          #     proseWrap: "always"
          #   '';
          # in ["--config" configFile];
        };
        formatters_by_ft = {
          "*" = ["trim_whitespace"];
          cpp = ["clang-format"];
          markdown = [
            "markdownlint-cli2"
            # "prettier"
          ];
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

    indent-blankline = {
      enable = true;
      settings.scope.include.node_type.nix = ["attrset_expression"];
    };

    leap.enable = true;

    lsp = {
      enable = true;
      servers = {
        clangd.enable = true;
        markdown_oxide.enable = true;
        nil_ls = {
          enable = true;
          settings.nix.flake.autoArchive = true;
        };
        pyright.enable = true;
        tinymist = {
          enable = true;
          extraOptions.offset_encoding = "utf-8";
        };
      };
    };

    lualine = {
      enable = true;
      settings = {
        options = {
          component_separators = "";
          globalstatus = true;
          theme = "base16";
          section_separators = "";
        };
        sections = {
          lualine_a = ["mode"];
          lualine_b = [""];
          lualine_c = [
            "filetype"
            "filename"
          ];
          lualine_x = [
            {
              __unkeyed.__raw = ''
                function()
                  if vim.bo.filetype == "markdown" or vim.bo.filetype == "text" or vim.bo.filetype == "typst" then
                    local word_count = vim.fn.wordcount().words
                    if vim.fn.wordcount().visual_words ~= nil then
                      word_count = vim.fn.wordcount().visual_words
                    end

                    if word_count == 1 then
                      return "1 word"
                    else
                      return tostring(word_count) .. " words"
                    end
                  else
                    return ""
                  end
                end
              '';
            }
            "location"
          ];
          lualine_y = [""];
          lualine_z = [""];
        };
      };
    };

    luasnip.enable = true;

    mini = {
      enable = true;
      mockDevIcons = true;
      modules = {
        icons = lib.nixvim.emptyTable;
        pick = lib.nixvim.emptyTable;
      };
    };

    mkdnflow = {
      enable = true;
      mappings = {
        MkdnCreateLinkFromClipboard = {
          key = "<leader>mp";
          modes = [
            "n"
            "v"
          ];
        };
        MkdnFoldSection = {
          key = "<leader>mf";
          modes = "n";
        };
        MkdnTableNewColAfter = {
          key = "<leader>mic";
          modes = "n";
        };
        MkdnTableNewColBefore = {
          key = "<leader>miC";
          modes = "n";
        };
        MkdnTableNewRowAbove = {
          key = "<leader>miR";
          modes = "n";
        };
        MkdnTableNewRowBelow = {
          key = "<leader>mir";
          modes = "n";
        };
        MkdnUnfoldSection = {
          key = "<leader>mF";
          modes = "n";
        };
        MkdnUpdateNumbering = {
          key = "<leader>mnn";
          modes = "n";
        };
      };
      toDo.symbols = [" " "x"];
    };

    nvim-autopairs = {
      enable = true;
      settings.checkTs = true;
    };

    nvim-tree = {
      enable = true;
      git.ignore = false;
    };

    obsidian = lib.mkIf (config.notesDirectory != null) {
      enable = true;
      settings = {
        daily_notes = {
          folder = "journals";
          template = "journal_template.md";
        };
        mappings = lib.nixvim.emptyTable;
        templates.subdir = "templates";
        workspaces = [
          {
            name = "main";
            path = config.notesDirectory;
          }
        ];
      };
    };

    telescope.enable = true;

    treesitter = {
      enable = true;
      folding = true;
      settings = {
        # highlight.enable = true;
        indent.enable = true;
      };
    };

    typst-vim.enable = true;

    which-key = {
      enable = true;
      settings.spec = [
        {
          __unkeyed = "<leader>f";
          group = "Format";
        }
        {
          __unkeyed = "<leader>p";
          group = "Pick";
        }
        {
          __unkeyed = "<leader>t";
          group = "Toggle";
        }
      ];
    };
  };
}
