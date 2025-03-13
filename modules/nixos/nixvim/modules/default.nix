{lib, ...}: {
  imports = [
    ./plugins
    ./autoCmd.nix
    ./clipboard.nix
    ./colorschemes.nix
    ./extraConfigLua.nix
    ./extraPackages.nix
    ./extraPlugins.nix
    ./globals.nix
    ./keymaps.nix
    ./opts.nix
  ];

  options = {
    base16Scheme = lib.mkOption {
      type = lib.types.str;
      default = "nord";
    };
    cpDirectory = lib.mkOption {
      type = lib.types.str;
      default = "";
    };
    plugins.extraPlugins = {
      fcitx5.enable = lib.mkEnableOption "fcitx5";
      img-clip.enable = lib.mkEnableOption "img-clip";
      lorem.enable = lib.mkEnableOption "lorem";
      substitute.enable = lib.mkEnableOption "substitute";
    };
  };
}
