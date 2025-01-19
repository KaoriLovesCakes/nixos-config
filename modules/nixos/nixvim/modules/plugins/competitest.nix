{
  config,
  lib,
  ...
}: {
  plugins.competitest = lib.mkIf (config.cpDirectory != "") {
    enable = true;
    settings = {
      received_contests_directory = lib.nixvim.mkRaw ''
        function(task, file_extension)
          local hyphen = string.find(task.group, " - ")
          local judge, contest
          if not hyphen then
            judge = task.group
            contest = "unknown_contest"
          else
            judge = string.sub(task.group, 1, hyphen - 1)
            contest = string.sub(task.group, hyphen + 3)
          end
          return string.format("${config.cpDirectory}/%s/%s", judge, contest)
        end
      '';
      received_contests_problems_path = lib.nixvim.mkRaw ''
        function(task, file_extension)
          return string.format("%s/%s.%s", task.name, task.name, file_extension)
        end
      '';
      received_contests_prompt_directory = false;
      received_contests_prompt_extension = false;
      received_problems_path = lib.nixvim.mkRaw ''
        function(task)
          local hyphen = string.find(task.group, " - ")
          local judge, contest
          if not hyphen then
            judge = task.group
            contest = "unknown_contest"
          else
            judge = string.sub(task.group, 1, hyphen - 1)
            contest = string.sub(task.group, hyphen + 3)
          end
          return string.format("${config.cpDirectory}/%s/%s/%s/%s.%s", judge, contest, task.name, task.name, file_extension)
        end
      '';
      received_problems_prompt_path = false;
      template_file = lib.nixvim.mkRaw ''
        {
          cpp = "${config.cpDirectory}/template.cpp"
        }
      '';
    };
  };
}
