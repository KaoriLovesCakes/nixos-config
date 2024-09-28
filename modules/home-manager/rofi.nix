{
  config,
  pkgs,
  ...
}: {
  home = {
    file.".config/rofimoji.rc".text = ''
      files = [math, nerd_font]
      prompt =
    '';
    packages = [
      pkgs.rofimoji
      pkgs.xdotool
    ];
  };
  programs.rofi = {
    enable = true;
    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      "*" = {padding = 1;};
      # "element-text" = {padding = 1;};
    };
  };
}
