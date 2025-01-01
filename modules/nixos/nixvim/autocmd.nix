{
  programs.nixvim.autoCmd = [
    # {
    #   callback.__raw = ''
    #     function()
    #       if vim.bo.filetype == "markdown" or vim.bo.filetype == "text" or vim.bo.filetype == "typst" then
    #         vim.cmd("set colorcolumn=96")
    #         vim.cmd("set fo+=wa")
    #         vim.cmd("set textwidth=96")
    #       end
    #     end
    #   '';
    #   event = ["BufEnter"];
    #   pattern = ["*"];
    # }
  ];
}
