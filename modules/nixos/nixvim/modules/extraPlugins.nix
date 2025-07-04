{
  config,
  lib,
  pkgs,
  ...
}: {
  extraPlugins = lib.flatten [
    (
      lib.optional config.plugins.extraPlugins.nvzone.floaterm.enable (
        (pkgs.vimUtils.buildVimPlugin {
          name = "floaterm";
          src = pkgs.fetchFromGitHub {
            owner = "nvzone";
            repo = "floaterm";
            rev = "HEAD";
            hash = "sha256-CRf6jN2uyRPfS++gyJs/Yn4Dz80tctvJ502YziiBE74=";
          };
        }).overrideAttrs {
          dependencies = [pkgs.vimPlugins.nvzone-volt];
        }
      )
    )
    (lib.optional config.plugins.extraPlugins.lorem.enable (pkgs.vimUtils.buildVimPlugin {
      name = "lorem";
      src = pkgs.fetchFromGitHub {
        owner = "derektata";
        repo = "lorem.nvim";
        rev = "HEAD";
        hash = "sha256-1tTFCR5mNE29nEqi3u7GcsXprkwKgGuilrSl94I6WY0=";
      };
    }))
    (lib.optional config.plugins.extraPlugins.substitute.enable pkgs.vimPlugins.substitute-nvim)
  ];
}
