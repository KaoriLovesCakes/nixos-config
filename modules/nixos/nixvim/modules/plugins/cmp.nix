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
      mapping = let
        confirm_item = ''
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
        select_next_item = ''
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
        select_prev_item = ''
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
      in {
        "<CR>" = confirm_item;
        "<S-Tab>" = select_prev_item;
        "<Tab>" = select_next_item;
        "<Up>" = select_prev_item;
        "<Down>" = select_next_item;
      };
    };
  };
}
