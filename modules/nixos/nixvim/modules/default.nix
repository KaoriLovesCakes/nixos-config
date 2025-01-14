{lib, ...}: {
  imports = [
    ./extra-plugins
    ./plugins
    ./autocmd.nix
    ./clipboard.nix
    ./colorschemes.nix
    ./globals.nix
    ./keymaps.nix
    ./opts.nix
  ];

  options = {
    base16-scheme = lib.mkOption {
      type = lib.types.str;
      default = "nord";
    };
    notesDirectory = lib.mkOption {
      type = lib.types.str;
      default = "";
    };
  };
}
