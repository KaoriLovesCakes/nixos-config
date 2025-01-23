{lib, ...}: {
  plugins.blink-cmp = {
    enable = true;
    settings = {
      completion = {
        list.selection.preselect = false;
        menu.auto_show = lib.nixvim.mkRaw ''
          function(ctx)
            return ctx.mode ~= "cmdline" or not vim.tbl_contains({ '/', '?' }, vim.fn.getcmdtype())
          end
        '';
      };
      keymap = {
        "<CR>" = ["accept" "fallback"];
        "<Esc>" = ["hide" "fallback"];
        "<S-Tab>" = ["select_prev" "snippet_backward" "fallback"];
        "<Tab>" = ["show" "select_next" "snippet_forward" "fallback"];
        "<Up>" = ["select_prev" "fallback"];
        "<Down>" = ["select_next" "fallback"];
        "<C-k>" = ["select_prev" "fallback"];
        "<C-j>" = ["select_next" "fallback"];
        "<C-h>" = ["snippet_backward"];
        "<C-l>" = ["snippet_forward"];
      };
      snippets.preset = "luasnip";
      sources.providers.snippets.score_offset = 0;
    };
  };
}
