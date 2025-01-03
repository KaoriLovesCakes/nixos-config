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
    #     hash = "sha256-SM3MWheqaMxvHnPxLUIdFNHqYJSLjZ2mgN7QG0qu1jw=";
    #   };
    # })

    # (pkgs.vimUtils.buildVimPlugin {
    #   name = "cphelper-nvim";
    #   src = pkgs.fetchFromGitHub {
    #     owner = "p00f";
    #     repo = "cphelper.nvim";
    #     rev = "main";
    #     hash = "";
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

    pkgs.vimPlugins.dropbar-nvim
    pkgs.vimPlugins.substitute-nvim
  ];
}
