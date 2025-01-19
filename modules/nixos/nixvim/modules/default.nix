{lib, ...}: {
  imports = [
    ./plugins
    ./autocmd.nix
    ./clipboard.nix
    ./colorschemes.nix
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
  };
}
