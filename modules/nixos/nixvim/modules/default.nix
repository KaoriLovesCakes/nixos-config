{lib, ...}: {
  imports = [
    ./plugins
    ./autoCmd.nix
    ./clipboard.nix
    ./extraConfigLua.nix
    ./extraPackages.nix
    ./extraPlugins.nix
    ./globals.nix
    ./keymaps.nix
    ./opts.nix
  ];

  options.plugins.extraPlugins = {
    iron.enable = lib.mkEnableOption "iron";
    lorem.enable = lib.mkEnableOption "lorem";
    substitute.enable = lib.mkEnableOption "substitute";
  };
}
