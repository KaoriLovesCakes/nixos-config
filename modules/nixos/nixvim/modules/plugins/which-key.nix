{lib, ...}: {
  plugins.which-key = {
    enable = true;
    settings.spec = [
      ((lib.nixvim.listToUnkeyedAttrs ["<leader>f"]) // {group = "Format";})
      ((lib.nixvim.listToUnkeyedAttrs ["<leader>m"]) // {group = "Markdown";})
      ((lib.nixvim.listToUnkeyedAttrs ["<leader>p"]) // {group = "Pick";})
      ((lib.nixvim.listToUnkeyedAttrs ["<leader>t"]) // {group = "Toggle";})
    ];
  };
}
