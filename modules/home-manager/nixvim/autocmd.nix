{globals, ...}: {
  programs.nixvim.autoCmd = [
    {
      callback.__raw = ''
        function(args)
          vim.schedule(function()
            local content = vim.api.nvim_buf_get_lines(args.buf, 0, -1, false)
            if (#content > 1 or content[1] ~= ''') then
              return
            end

            if string.find(args.file, '/journal/') then
              vim.api.nvim_cmd({cmd = 'Neorg', args = {'templates', 'fload', 'journal'}}, {})
            else
              vim.api.nvim_cmd({cmd = 'Neorg', args = {'templates', 'fload', 'default'}}, {})
            end
          end)
        end
      '';
      event = ["BufNew"];
      pattern = ["${globals.notesDirectory}/*.norg"];
    }
  ];
}
