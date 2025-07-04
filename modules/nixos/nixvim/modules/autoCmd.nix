{
  config,
  lib,
  ...
}: {
  autoCmd =
    [
      {
        callback = lib.nixvim.mkRaw ''
          function()
            vim.keymap.set("n", "j", "gj", { buffer = true, noremap = true })
            vim.keymap.set("n", "k", "gk", { buffer = true, noremap = true })
          end
        '';
        event = ["FileType"];
        pattern = ["markdown" "text" "types"];
      }

      {
        callback = lib.nixvim.mkRaw ''
          function()
            if vim.fn.executable("fcitx5-remote") == 1 then
              vim.fn.jobstart({"fcitx5-remote", "-s", "keyboard-us-altgr-intl"})
            end
          end
        '';
        event = ["InsertLeave"];
        pattern = ["*"];
      }
    ]
    ++ lib.optionals (config.plugins.snacks.enable && (builtins.hasAttr "terminal" config.plugins.snacks.settings)) [
      {
        callback = lib.nixvim.mkRaw ''
          function()
            vim.keymap.set("n", "<LocalLeader>c", function()
              local cmd = string.format("typst watch %s --open", vim.fn.shellescape(vim.api.nvim_buf_get_name(0)))
              Snacks.terminal.toggle(cmd)
            end, { buffer = true, desc = "Compile and watch", noremap = true })
          end
        '';
        event = ["FileType"];
        pattern = "typst";
      }
    ];
}
