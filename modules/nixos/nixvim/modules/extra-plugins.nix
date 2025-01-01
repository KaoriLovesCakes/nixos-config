{pkgs, ...}: {
  extraConfigLua = ''
    require('fcitx5').setup({
      define_autocmd = true,
      remember_prior = true,
    })

    require('lorem').opts({})
    require('substitute').setup({})
  '';

  extraPlugins = [
    # (pkgs.vimUtils.buildVimPlugin {
    #   name = "assistant-nvim";
    #   src = pkgs.fetchFromGitHub {
    #     owner = "A7Lavinraj";
    #     repo = "assistant.nvim";
    #     rev = "main";
    #     hash = "sha256-w+Jag+bDS93CyIeRM/4TGm5B2/alxSO43by2rNcCgkI=";
    #   };
    # })

    (pkgs.vimUtils.buildVimPlugin {
      name = "fcitx5-nvim";
      src = pkgs.fetchFromGitHub {
        owner = "pysan3";
        repo = "fcitx5.nvim";
        rev = "v1.1.0";
        hash = "sha256-AUfakFumvNI4KTYdeUrZc/ybHzgxPNlAGI9pYBYXFFg=";
      };
    })

    (pkgs.vimUtils.buildVimPlugin {
      name = "lorem-nvim";
      src = pkgs.fetchFromGitHub {
        owner = "derektata";
        repo = "lorem.nvim";
        rev = "main";
        hash = "sha256-1BoIz6n1vs7ZZbatLZTpECwFkeOsek3AxTYFRUjggCM=";
      };
    })

    # (pkgs.vimUtils.buildVimPlugin {
    #   name = "menu";
    #   src = pkgs.fetchFromGitHub {
    #     owner = "nvzone";
    #     repo = "menu";
    #     rev = "main";
    #     hash = "sha256-dc91BYkFXXDcd4+9G9BV46CoSLNOD8B0UXRiDDOMWnM=";
    #   };
    # })

    # (pkgs.vimUtils.buildVimPlugin {
    #   name = "volt";
    #   src = pkgs.fetchFromGitHub {
    #     owner = "nvzone";
    #     repo = "volt";
    #     rev = "main";
    #     hash = "sha256-/sYO6nqkehVNcRHx5kaFXJ9BlAVIf8Qi21A4XI9/ymU=";
    #   };
    # })

    pkgs.vimPlugins.substitute-nvim
  ];
}
