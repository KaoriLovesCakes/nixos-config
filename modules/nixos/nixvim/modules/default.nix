{lib, ...}: {
  imports = [
    ./autocmd.nix
    ./config.nix
    ./extra-plugins.nix
    ./keymaps.nix
    ./plugins.nix
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
