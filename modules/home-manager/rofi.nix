{
  config,
  pkgs,
  ...
}: {
  home.file.".config/rofimoji.rc".text = ''
    action = copy
    files = [math]
    prompt =
  '';
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      "*" = {padding = 1;};
      # "element-text" = {padding = 1;};
    };
  };
}
