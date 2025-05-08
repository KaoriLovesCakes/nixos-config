{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      return {
        default_cursor_style = "SteadyBar",
        enable_tab_bar = false,
        font = require("wezterm").font_with_fallback({
          "JetBrainsMonoNL NFM",
          "Noto Sans Mono CJK JP",
          "Noto Color Emoji",
        }),
        harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
      }
    '';
  };
}
