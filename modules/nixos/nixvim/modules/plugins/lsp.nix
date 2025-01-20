{
  plugins.lsp = {
    enable = true;
    servers = {
      clangd.enable = true;
      markdown_oxide.enable = true;
      nil_ls = {
        enable = true;
        settings.nix.flake.autoArchive = true;
      };
      pyright.enable = true;
      tinymist = {
        enable = true;
        extraOptions.offset_encoding = "utf-16";
      };
    };
  };
}
