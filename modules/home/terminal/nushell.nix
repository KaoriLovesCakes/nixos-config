{
  config,
  globals,
  pkgs,
  ...
}: {
  home.packages = [pkgs.fish];
  programs.nushell = {
    enable = true;
    environmentVariables = config.meta.variables;
    extraConfig = ''
      let fish_completer = {|spans|
          fish --command $"complete '--do-complete=($spans | str join ' ')'"
          | from tsv --flexible --noheaders --no-infer
          | rename value description
          | update value {
              if ($in | path exists) {$'"($in | str replace "\"" "\\\"" )"'} else {$in}
          }
      }

      $env.config.completions.external.completer = $fish_completer
      $env.config.show_banner = false
      $env.config.table.mode = "reinforced"
      $env.config.hooks.command_not_found = {|command_name|
        try { command-not-found $command_name }
      }
    '';
    shellAliases = {
      l = "ls -al";
      la = "ls -a";
      ll = "ls -l";
    };
  };
  home.sessionVariables.LS_COLORS = builtins.readFile (pkgs.runCommand "vivid" {} ''
    ${pkgs.vivid}/bin/vivid generate ${globals.theme} > $out
  '');
}
