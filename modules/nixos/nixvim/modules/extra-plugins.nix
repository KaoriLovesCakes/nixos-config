{pkgs, ...}: {
  extraConfigLua = ''
    require("fcitx5").setup({
      define_autocmd = true,
      remember_prior = true,
    })

    require("img-clip").setup({
      filetypes = {
        typst = {
          template = [[
            #figure(
              image("$FILE_PATH"),
              caption: [$CURSOR],
            ) <fig-$LABEL>
          ]],
        },
      }
    })

    require("lorem").opts({})
    require("substitute").setup({})
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

    (pkgs.vimUtils.buildVimPlugin {
      name = "img-clip";
      src = pkgs.fetchFromGitHub {
        owner = "HakonHarnes";
        repo = "img-clip.nvim";
        rev = "v0.5.0";
        hash = "sha256-TTfRow1rrRZ3+5YPeYAQc+2fsb42wUxTMEr6kfUiKXo=";
      };
    })

    (pkgs.vimUtils.buildVimPlugin {
      name = "lorem";
      src = pkgs.fetchFromGitHub {
        owner = "derektata";
        repo = "lorem.nvim";
        rev = "main";
        hash = "sha256-1BoIz6n1vs7ZZbatLZTpECwFkeOsek3AxTYFRUjggCM=";
      };
    })

    pkgs.vimPlugins.substitute-nvim
  ];
}
