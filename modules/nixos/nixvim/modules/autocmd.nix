{
  autoCmd = [
    {
      callback.__raw = ''
        function()
          vim.ui.open(vim.fn.expand("%:p"))
        end
      '';
      event = ["BufRead"];
      pattern = ["*.pdf"];
    }

    {
      callback.__raw = ''
        function(args)
          vim.b.typst_job_id = vim.fn.jobstart({
            "typst", "watch", args.file, "--open"
          }, { detach = true })
        end
      '';
      event = ["BufRead"];
      pattern = ["*.typ"];
    }

    {
      callback.__raw = ''
        function()
          if vim.b.typst_job_id then
            vim.fn.jobstop(vim.b.typst_job_id)
            vim.b.typst_job_id = nil
          end
        end
      '';
      event = ["BufDelete"];
      pattern = ["*.typ"];
    }
  ];
}
