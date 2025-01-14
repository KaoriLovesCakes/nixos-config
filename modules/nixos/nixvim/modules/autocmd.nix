{lib, ...}: {
  autoCmd = [
    {
      callback = lib.nixvim.mkRaw ''
        function()
          vim.ui.open(vim.fn.expand("%:p"))
        end
      '';
      event = ["BufRead"];
      pattern = ["*.pdf"];
    }

    {
      callback = lib.nixvim.mkRaw ''
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
      callback = lib.nixvim.mkRaw ''
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
