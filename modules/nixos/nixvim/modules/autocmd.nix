{
  autoCmd = [
    {
      callback.__raw = ''
        function()
          if vim.bo.filetype == "pdf" then
            vim.ui.open(vim.fn.expand("%:p"))
          end
        end
      '';
      event = ["BufEnter"];
      pattern = ["*"];
    }
  ];
}
