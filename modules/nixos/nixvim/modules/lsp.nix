{
  lsp.servers = {
    clangd.enable = true;
    nil_ls = {
      enable = true;
      settings.nix.flake.autoArchive = true;
    };
    pyright.enable = true;
    tinymist = {
      enable = true;
      settings.offset_encoding = "utf-16";
    };
  };
}
