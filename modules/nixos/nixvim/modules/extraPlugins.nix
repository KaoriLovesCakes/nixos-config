{
  config,
  lib,
  pkgs,
  ...
}: {
  extraPlugins = lib.flatten [
    (lib.optional config.plugins.extraPlugins.iron.enable pkgs.vimPlugins.iron-nvim)
    (lib.optional config.plugins.extraPlugins.lorem.enable (pkgs.vimUtils.buildVimPlugin {
      name = "lorem";
      src = pkgs.fetchFromGitHub {
        owner = "derektata";
        repo = "lorem.nvim";
        rev = "main";
        hash = "sha256-3bcXlSid77GisGiJJAZvma/ZRkcUHr7Hrf9tjfViJl0=";
      };
    }))
    (lib.optional config.plugins.extraPlugins.substitute.enable pkgs.vimPlugins.substitute-nvim)
  ];
}
