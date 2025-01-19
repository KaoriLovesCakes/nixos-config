{pkgs, ...}: {
  extraConfigLua = "require('lorem').opts({})";
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "lorem";
      src = pkgs.fetchFromGitHub {
        owner = "derektata";
        repo = "lorem.nvim";
        rev = "main";
        hash = "sha256-1BoIz6n1vs7ZZbatLZTpECwFkeOsek3AxTYFRUjggCM=";
      };
    })
  ];
}
