{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      return {
        default_cursor_style = "SteadyBar",
        enable_tab_bar = false,
        font = require("wezterm").font_with_fallback({
          "JetBrainsMonoNL NFM",
          "Source Han Sans",
        }),
        harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
      }
    '';
  };
}
