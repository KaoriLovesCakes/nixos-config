{
  plugins.cmp = {
    enable = true;
    autoEnableSources = true;
    settings = {
      snippet.expand = ''
        function(args)
          require('luasnip').lsp_expand(args.body)
        end
      '';
      sources = [
        {name = "luasnip";}
        {name = "nvim_lsp";}
        {name = "path";}
      ];
      mapping = {
        "<CR>" = ''
          require('cmp').mapping(
            function(fallback)
              if require('cmp').visible() then
                if require('luasnip').expandable() then
                  require('luasnip').expand()
                else
                  require('cmp').confirm({
                    select = true,
                  })
                end
              else
                fallback()
              end
            end
          )
        '';
        "<S-Tab>" = ''
          require('cmp').mapping(
            function(fallback)
              if require('cmp').visible() then
                require('cmp').select_prev_item()
              elseif require('luasnip').locally_jumpable(-1) then
                require('luasnip').jump(-1)
              else
                fallback()
              end
            end,
          { 'i', 's' })
        '';
        "<Tab>" = ''
          require('cmp').mapping(
            function(fallback)
              if require('cmp').visible() then
                require('cmp').select_next_item()
              elseif require('luasnip').locally_jumpable(1) then
                require('luasnip').jump(1)
              else
                fallback()
              end
            end,
          { 'i', 's' })
        '';
      };
    };
  };
}
