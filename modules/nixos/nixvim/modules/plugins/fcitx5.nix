{pkgs, ...}: {
  extraConfigLua = ''
    require("fcitx5").setup({
      define_autocmd = true,
      remember_prior = true,
    })
  '';
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "fcitx5";
      src = pkgs.fetchFromGitHub {
        owner = "pysan3";
        repo = "fcitx5.nvim";
        rev = "v1.1.0";
        hash = "sha256-AUfakFumvNI4KTYdeUrZc/ybHzgxPNlAGI9pYBYXFFg=";
      };
    })
  ];
}
