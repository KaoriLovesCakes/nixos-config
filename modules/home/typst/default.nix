{
  globals,
  pkgs,
  ...
}: {
  home = {
    file.".local/share/typst/packages/local" = {
      recursive = true;
      source = ./local;
    };
    packages = [pkgs.typst];
    sessionVariables = {
      TYPST_FONT_PATHS = "${globals.homeDirectory}/.local/share/fonts";
      TYPST_ROOT = globals.homeDirectory;
    };
  };
}
