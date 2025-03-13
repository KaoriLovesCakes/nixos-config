{
  config,
  lib,
  pkgs,
  ...
}: {
  extraPlugins =
    lib.optional config.plugins.extraPlugins.img-clip.enable pkgs.vimPlugins.img-clip-nvim
    ++ lib.optional config.plugins.extraPlugins.substitute.enable pkgs.vimPlugins.substitute-nvim
    ++ lib.optional config.plugins.extraPlugins.fcitx5.enable (pkgs.vimUtils.buildVimPlugin {
      name = "fcitx5";
      src = pkgs.fetchFromGitHub {
        owner = "pysan3";
        repo = "fcitx5.nvim";
        rev = "v1.1.0";
        hash = "sha256-AUfakFumvNI4KTYdeUrZc/ybHzgxPNlAGI9pYBYXFFg=";
      };
    })
    ++ lib.optional config.plugins.extraPlugins.lorem.enable (pkgs.vimUtils.buildVimPlugin {
      name = "lorem";
      src = pkgs.fetchFromGitHub {
        owner = "derektata";
        repo = "lorem.nvim";
        rev = "main";
        hash = "sha256-1BoIz6n1vs7ZZbatLZTpECwFkeOsek3AxTYFRUjggCM=";
      };
    });
}
