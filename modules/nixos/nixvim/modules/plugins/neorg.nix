{
  lib,
  pkgs,
  ...
}: {
  extraPlugins = [
    (
      (pkgs.vimUtils.buildVimPlugin {
        name = "neorg-hop-extras";
        src = pkgs.fetchFromGitHub {
          owner = "phenax";
          repo = "neorg-hop-extras";
          rev = "main";
          hash = "sha256-oQAzu17Mu91XPBDrn8OBOTdIhQmJOpab+nPlEZqAUZs=";
        };
      })
      .overrideAttrs
      (old: {
        nvimSkipModule = [
          "example"
          "neorg.modules.external.hop-extras.module"
        ];
      })
    )

    (
      (pkgs.vimUtils.buildVimPlugin {
        name = "neorg-templates";
        src = pkgs.fetchFromGitHub {
          owner = "pysan3";
          repo = "neorg-templates";
          rev = "v2.0.3";
          hash = "sha256-nZOAxXSHTUDBpUBS/Esq5HHwEaTB01dI7x5CQFB3pcw=";
        };
      })
      .overrideAttrs
      (old: {
        nvimSkipModule = [
          "neorg.modules.external.templates.default_snippets"
          "neorg.modules.external.templates.module"
          "neorg.modules.external.templates.snippet_handler"
        ];
      })
    )
  ];

  plugins.neorg = {
    enable = true;
    settings.load = {
      "core.completion".config.engine = "nvim-cmp";
      "core.concealer".__empty = null;
      "core.defaults".__empty = null;
      "core.dirman".config = {
        workspaces.main = lib.mkRaw "string.format('%s/Documents', vim.loop.os_homedir())";
        default_workspace = "main";
      };
      "core.journal".config.strategy = "flat";
      "core.latex.renderer".__empty = null;
      "external.hop-extras".__empty = null;
      "external.templates".config.templates_dir = lib.mkRaw "string.format('%s/Documents/Templates', vim.loop.os_homedir())";
    };
  };
}
