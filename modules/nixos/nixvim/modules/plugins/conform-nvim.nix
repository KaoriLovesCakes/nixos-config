{
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

  plugins.conform-nvim = {
    enable = true;
    settings = {
      format_on_save = lib.nixvim.mkRaw "{}";
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
}
