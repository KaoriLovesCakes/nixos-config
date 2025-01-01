{
  config,
  globals,
  pkgs,
  ...
}: {
  programs.nixvim =
    (import ./modules {inherit config globals pkgs;})
    // {
      enable = true;
      defaultEditor = true;
    };
}
